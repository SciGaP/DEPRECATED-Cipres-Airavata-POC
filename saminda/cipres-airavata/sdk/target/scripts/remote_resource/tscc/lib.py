import os
import string
import math
import re
import subprocess

# I didn't implement getProperties, found it somewhere, just reads a java style
# properties file into a dictionary.
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

def getToolType(commandlineString):
    return None 
    
queues = (("hotel", 4320.0), )
account = "cipres_test"
scheduler_file = "scheduler.conf"
email = "terri@sdsc.edu"
jobname = ""
runfile = "./batch_command.run"
statusfile = "./batch_command.status"
cmdfile = "./batch_command.cmdline"
jobdir = os.getcwd()
jobname = os.environ.get("WB_JOBID", "cipres")

def schedulerInfo(properties, tooltype):
    """ properties is a dictionary containing keys: 
    jobtype, mpi_processes, threads_per_process, nodes, runhours.
    Based on properties and hardcoded info about the resource this returns a dictionary
    containing:
    is_direct, is_mpi, queue, runtime, mpi_processes, nodes, ppn"""


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

    # Create retval and set values we just determined for runtime and queue.  
    # At the moment we only run serial jobs and only in the shared queue.
    retval =    {"runtime":runtime, "queue":queue, "threads_per_process":int(properties.get("threads_per_process", 0)),
                 "nodes": int(properties.get("nodes", 1)), "ppn": int(1)}
    return retval

def log(filename, message):
    f = open(filename, "a")
    f.write(message)
    f.close()

def deleteJob(jobid, workingdir):
    if os.path.isfile(workingdir + "/cancelJobs"):
        os.chdir(workingdir)
        cmd = "./cancelJobs %d" %  jobid
    else:
        cmd = "qdel %d" % jobid
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    outerr = p.communicate()
    output =  outerr[0]
    err = outerr[1]
    if (p.returncode != 0):
        raise SystemError("Error running '%s', return code is %d. stdout is '%s', stderr is '%s'" % (cmd,  
            p.returncode, output, err))

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

    # cmd = 'echo "%s" | grep `whoami`' % output
    cmd = 'grep `whoami`' 
    p = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    outerr = p.communicate(output)
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


# Returns 0 on success, 2 means too many jobs queued.
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

        # When we return 2 it means too many jobs are queued.  qstat returns -226 on abe
        # in this situation ... not sure if that's true here, on trestles as well.
        if retval == -226:
            retval = 2

        log(statusfile, "submit_job is returning %d\n" %  retval)

        return retval
    log(statusfile, "qsub output is: " + output + "\n" + 
        "======================================================================" +  "\n")

    p = re.compile(r"^(\d+).triton.\S+", re.M)
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

