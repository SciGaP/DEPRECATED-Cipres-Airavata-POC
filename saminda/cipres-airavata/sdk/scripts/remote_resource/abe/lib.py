import os
import string
import math
import re
import subprocess

def getProperties(filename):
    propFile= file( filename, "rU" )
    propDict= dict()
    for propLine in propFile:
        propDef= propLine.strip()
        if len(propDef) == 0:
            continue
        if propDef[0] in ( '!', '#' ):
            continue
        punctuation= [ propDef.find(c) for c in ':= ' ] + [ len(propDef) ]
        found= min( [ pos for pos in punctuation if pos != -1 ] )
        name= propDef[:found].rstrip()
        value= propDef[found:].lstrip(":= ").rstrip()
        propDict[name]= value
    propFile.close()
    # print propDict
    return propDict


short_queue = "debug"
long_queue = "long"
queues = (("debug",30.0), ("normal",2880.0), ("long",10080.0))
cores_per_node = 8
# Effectively get rid of max_nodes by setting it to 5000
max_nodes = 5000
max_cores = max_nodes * cores_per_node
default_cores = cores_per_node
account = "TG-DEB090011"
scheduler_file = "scheduler.conf"
email = "terri@sdsc.edu"
jobname = ""
runfile = "./batch_command.run"
statusfile = "./batch_command.status"
cmdfile = "./batch_command.cmdline"
jobdir = os.getcwd()
jobname = os.environ.get("WB_JOBID", "cipres")

def schedulerInfo(properties):
    """ properties is a dictionary containing keys: 
    jobtype, mpi_processes, threads_per_process, nodes, runhours.
    Based on properties and hardcoded info about the resource this returns a dictionary
    containing:
    is_mpi, queue, runtime, mpi_processes, nodes, ppn"""

    # get runhours from properties and convert it to minutes, default to zero if not specified.
    try:
        runtime  = properties.get("runhours", 0.0)
        runtime = math.ceil(float(runtime) * 60 )
    except:
        runtime = 0.0

    qname = 0
    qlimit = 1
    # if runtime is 0 (which isn't really valid), change it to limit for the shortest queue
    # so we have something reasonable to work with.
    if runtime == 0.0:
        runtime = queues[qname][qlimit]

    # based on runtime, figure out which queue we should be using.
    queue = None
    for entry in queues:
        if runtime <= entry[qlimit]:
            queue = entry[qname] 
            break
    if queue == None:
        queue = queues[-1][qname] 
        runtime = queues[-1][qlimit]

    retval = {"runtime":runtime, "queue":queue}
    if properties.get("jobtype", "")  == "mpi":
        retval["is_mpi"]  = True 
    else:
        retval["is_mpi"] = False 

    if (retval["is_mpi"] == 1):
        # Some of our pise xml interfaces just specify the number of mpi processes they want. 
        # We round it down to a multiple of the number of cores per node and request enough nodes
        # so that each mpi process has its own core.
        if (properties.get("nodes", "") == "") and (properties.get("thread_per_process", "") == ""):
            processes = int(properties.get("mpi_processes", 1))
            processes = int(processes / cores_per_node) * cores_per_node
            processes = min(max(processes, default_cores), max_cores)
            retval["nodes"] = processes / cores_per_node 
            retval["mpi_processes"] = processes 
            retval["ppn"] = int(retval["mpi_processes"]) / int(retval["nodes"]);
        # Pise interfaces that have more knowledge of the specific machine explicitly specify
        # the number of nodes as well as the number of mpi processes; we don't 2nd guess them.
        else:
            retval["nodes"] = int(properties.get("nodes", 1));
            retval["mpi_processes"] = int(properties.get("mpi_processes", 1));
            retval["ppn"] = int(retval["mpi_processes"]) / int(retval["nodes"]);

    return retval

def log(filename, message):
    f = open(filename, "a")
    f.write(message)
    f.close()

def jobInQueue():
    cmd = "qstat"
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    outerr = p.communicate()
    output =  outerr[0]
    err = outerr[1]
    if (p.returncode != 0):
        raise SystemError("Error running qstat, return code is %d. stderr is %s" % (p.returncode, err))
    if (len(err) != 0):
        raise SystemError("Error running qstat, stderr is %s" % (err))
    if (len(output) < 5):
        raise SystemError("Error running qstat, output looks wrong: %s" % (output))

    cmd = 'echo "%s" | grep `whoami`' % output
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    outerr = p.communicate()
    output =  outerr[0]
    err = outerr[1]
    if (len(err) != 0):
        raise SystemError("Error piping qstat thru grep:  %s" % (err))

    output_rows = output.split("\n")
    jobs = [] 
    for row in output_rows:
        r = row.split()
        if len(r) > 4 and r[4] != "C":
            r[0] = r[0].split(".", 1)[0]
            jobs.append(r[0])
    return jobs






def submitJob():  
    cmd = "qsub %s 2>> %s" % (runfile, statusfile)
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)  
    output =  p.communicate()[0]
    retval = p.returncode
    if retval != 0:
        # read whatever qsub wrote to the statusfile and print it to stdout
        print "Error submitting job:\n"
        f = open(statusfile, "r"); print f.read(), "\n\n"; f.close()
        print output 

        if retval == -226:
            retval = 2

        log(statusfile, "submit_job is returning %d\n" %  retval)

        return retval
    log(statusfile, "qsub output is: " + output + "\n" + 
        "======================================================================" +  "\n")

    # output from qsub should look like:
    #   This job will be charged to account: dmf (TG-DEB090011)
    #   3053477.abem5.ncsa.uiuc.edu
    p = re.compile(r"^(\d+).abe\S+", re.M)
    m = p.search(output)
    if m != None:
        jobid = m.group(0)
        short_jobid = m.group(1)
        print "jobid=%d" % int(short_jobid)
        log(statusfile, "JOBID is %s\n" % jobid)
        log("./_JOBINFO.TXT", "\nJOBID=%s\n" % jobid)
        return 0
    else:
        print "Error, qsub says: %s" % output
        log(statusfile, "can't get jobid, submit_job is returning 1\n")
        return 1

