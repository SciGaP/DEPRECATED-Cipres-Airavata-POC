#!/usr/bin/env python
"""
    Run various queries against the CIPRES production database.  
    Unless otherwise noted, results are written to stdout in csv format.
    Usage:
        usage.py [-modifier] -flag

    where modifiers are:
        -c chargeNumber. Optional.  Limit search to chargeNumber (for cipres 
        allocation, iplant allocation, etc). 

    where flag is one of:
        -a  Joins job_stats and tgusage tables to print tgusage and user info for all jobs in the db
        -u  Joins job_stats and tgusage tables and prints SUs per user, per month.  
            Sorted by year and month, then user.
        -p  Shows sus for each user for the period.  
        -d  Shows sus for each user for the specified period.  For example "-p 2011-07-01,2012-06-30" 
            gets sus for jobs submitted between July 7 2011 and June 30 2012 inclusive.  
            yyyy-mm-dd date format only. 
        -t  Shows all sus for each user
        -w  Send overlimit emails

"""
import sys
import os
import re
import string
import subprocess
import tempfile
import getopt
import pymysql
from pymysql.err import IntegrityError, Error
import csv
import mailer

passwordFile = os.path.join(os.path.expanduser("~"), "scripts", "db_password.txt")
startOfPeriod = "2013-07-01"
chargeNumberClause = ""

def getColumnNames(cur):
    return [ t[0] for t in cur.description ]

def asCSV(cur):
    header = ",".join(getColumnNames(cur))
    sys.stdout.write("%s\n" %  header)
    for row in cur:
        line = ",".join([str(field) for field in row])
        sys.stdout.write("%s\n"% line)

def allUsage():
    global chargeNumberClause
    query = """
        select
        job_stats.tool_id,
        job_stats.jobhandle,
        job_stats.user_id,
        users.username,
        job_stats.email,
        tgusage.*
        from job_stats, tgusage, users  where
        %s
        job_stats.resource = tgusage.resource and
        job_stats.remote_job_id = tgusage.jobid and
        job_stats.user_id = users.user_id and
        abs(datediff(job_stats.date_submitted, tgusage.submit_time)) < 2
        order by (tgusage.submit_time)
        """ % chargeNumberClause
    print query
    # DictCursor isn't implemented in this version of pymysql
    # cur = conn.cursor(MySQLdb.cursors.DictCursor)
    cur = conn.cursor()
    cur.execute(query)
    asCSV(cur)
    cur.close()

def suPerUserTotal(date):
    global chargeNumberClause

    # If a range is given it must include a start date.  End date is optional.
    if date:
        dateRange = date.split(",")
        dateClause = " and job_stats.date_submitted >= '" + dateRange[0] + "' " 
        if len(dateRange) > 1 and dateRange[1]:
            dateClause = " and job_stats.date_submitted <= '" + dateRange[1] + "' " 
    else:
        dateClause = ""
    query = """
        select
        users.username,
        job_stats.user_id,
        job_stats.email,
        sum(tgusage.su)
        from job_stats, tgusage, users where
        %s
        job_stats.resource = tgusage.resource and
        job_stats.remote_job_id = tgusage.jobid and
        job_stats.user_id = users.user_id and
        abs(datediff(job_stats.date_submitted, tgusage.submit_time)) < 2
        """ % chargeNumberClause 
    query += dateClause + " group by users.username, job_stats.email"
    cur = conn.cursor()

    cur.execute(query)
    asCSV(cur)
    cur.close()

def suPerUser():
    global chargeNumberClause
    query = """
        select
        year(tgusage.end_time),
        monthname(tgusage.end_time),
        job_stats.user_id,
        users.username,
        job_stats.email,
        sum(tgusage.su)
        from job_stats, tgusage, users where
        %s
        job_stats.resource = tgusage.resource and
        job_stats.remote_job_id = tgusage.jobid and
        job_stats.user_id = users.user_id and
        abs(datediff(job_stats.date_submitted, tgusage.submit_time)) < 2
        group by year(tgusage.end_time), month(tgusage.end_time), users.username, job_stats.email
        """ % chargeNumberClause
    cur = conn.cursor()
    cur.execute(query)
    asCSV(cur)
    cur.close()

def overLimitWarning():
    global startOfPeriod, chargeNumberClause
    maxSusLevel0 = 10000
    maxSusLevel1 = 20000
    maxSusLevel2 = 30000
    maxSusLevel3 = 50000
    maxSusLevel4 = 80000


    # Find everyone who's used more than the lowest limit of sus.
    query = """
    select job_stats.user_id, users.username, users.email, sum(tgusage.su)
    from job_stats, tgusage, users where
    %s
    job_stats.resource = tgusage.resource and
    job_stats.remote_job_id = tgusage.jobid and
    abs(datediff(job_stats.date_submitted, tgusage.submit_time)) < 2 and
    job_stats.user_id = users.user_id and
    job_stats.date_submitted >= '%s'
    group by job_stats.user_id
    having sum(tgusage.su) > %d
    """ % (chargeNumberClause, startOfPeriod, maxSusLevel0)

    print "Executing query:\n%s" % query

    cur = conn.cursor()
    cur.execute(query)

    # Depending on the "level" of overusage we'll add a different type of 
    # SUWARNED preference to their user preferences.
    # print "The following users are over the lowest limit of: %d" % maxSusLevel0
    for row in cur:

        # print row

        sus = long(row[3])
        if sus > maxSusLevel4:
            level = 4
            key = "SUWARNED4"
        elif sus > maxSusLevel3:
            level = 3
            key = "SUWARNED3"
        elif sus > maxSusLevel2:
            level = 2
            key = "SUWARNED2"
        elif sus > maxSusLevel1:
            level = 1
            key = "SUWARNED1"
        else:
            level = 0
            key = "SUWARNED0"

        # If the insert suceedes we send the email.  Else if we get an IntegrityError
        # we know the record already existed and the email was already sent.
        query2 = """
            insert into user_preferences (user_id, value, preference)
            values(%d, now(), "%s")
        """ % (long(row[0]), key)

        cur2 = conn.cursor()
        try:
            cur2.execute(query2)
            conn.commit()
            print("Sending warning email to %s, uid=%d,  for level %d" % (row[2], row[0], level))

            mailer.overLimitWarning(row[2], level);
            # mailer.overLimitWarning("terri@sdsc.edu", level);

        except IntegrityError, ie:
            conn.rollback()
            # print str(ie)
            print "%s already issued for %d" % (key, long(row[0]))
        except Error, e:
            conn.rollback()
            print str(e)
            print "insert row for %d FAILED unexpectedly." % long(row[0])
        cur2.close()

    cur.close()


conn = None
def main(argv=None):
    global startOfPeriod
    global conn, chargeNumberClause
    if argv is None:
        argv = sys.argv


    # Get the database name and password
    properties = {} 
    pf = open(passwordFile, "r");
    for line in iter(pf):
        s = line.split('=')
        properties[s[0].strip()] = s[1].strip()
    
    conn = pymysql.connect(host=properties["host"], port=int(properties["port"]), user=properties["username"], 
        passwd=properties["password"], db=properties["db"])

    options, remainder = getopt.getopt(argv[1:], "hauwtpc:d:")
    for opt, arg in options:
        # either the name of the ref file or the directory that contains the ref files.
        if opt in ("-a"):
            allUsage()
            return 0
        elif opt in ("-u"):
            suPerUser()
            return 0
        elif opt in ("-w"):
            overLimitWarning()
            return 0
        elif opt in ("-t"):
            suPerUserTotal(None)
            return 0
        elif opt in ("-d"):
            dateRange = arg
            suPerUserTotal( dateRange )
            return 0
        elif opt in ("-p"):
            dateRange = arg
            if (dateRange):
                suPerUserTotal( dateRange )
            else:
                suPerUserTotal( startOfPeriod )
            return 0
        elif opt in ("-h"):
            print __doc__
            return 0
        elif opt in ("-c"):
            chargeNumber = arg
            chargeNumberClause = " tgusage.charge_number = '%s' and " % chargeNumber
    print __doc__
    return 0

if __name__ == "__main__":
    sys.exit(main())
