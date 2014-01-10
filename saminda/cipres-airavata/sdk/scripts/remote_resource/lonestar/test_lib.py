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


short_queue = "development"
long_queue = "normal"
queues = (("development",30.0), ("normal",2880.0))
cores_per_node = 4
# Set max_nodes to 5000 so that there is no effective max.
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

    retval = {}

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
    # Turns out lonestar doesn't allow more than 16 processors in a debug queue job so we may
    # amend the queue selection after determining the number of mpi processes.
    queue = None
    for entry in queues:
        if runtime <= entry[qlimit]:
            queue = entry[qname] 
            break
    if queue == None:
        queue = queues[-1][qname] 
        runtime = queues[-1][qlimit]

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
        retval["cores"] = retval["nodes"] * cores_per_node

        if retval["mpi_processes"] > 16 and queue == "development":
            queue = "normal"

    retval["runtime"] = runtime
    retval["queue"] = queue

    return retval

def log(filename, message):
    f = open(filename, "a")
    f.write(message)
    f.close()

def jobInQueue():
    cmd = "bjobs -w"
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)  
    outerr = p.communicate()
    output =  outerr[0]
    err = outerr[1] 
    if (p.returncode != 0):
        raise SystemError("Error running bjobs, return code is %d. stderr is %s" % (p.returncode, err))

    output_rows = output.split("\n")
    jobs = [] 
    for row in output_rows:
        r = row.split()
        if len(r) > 4 and r[2] != "EXIT" and r[2] != "DONE":
            jobs.append(r[0])
    return jobs

def submitJob():  
    cmd = "bsub < %s 2>> %s" % (runfile, statusfile)
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)  
    output =  p.communicate()[0]
    retval = p.returncode
    if retval != 0:
        # read whatever bsub wrote to the statusfile and print it to stdout
        print "Error submitting job:\n"
        f = open(statusfile, "r"); print f.read(), "\n\n"; f.close()
        print output 

        # Need to find out what bsub returns when we've already got too many
        # jobs queued.
        # if retval == -226:
            # retval = 2

        log(statusfile, "submit_job is returning %d\n" %  retval)

        return retval
    log(statusfile, "bsub output is: " + output + "\n" + 
        "======================================================================" +  "\n")

    # output from bsub should look like:
    # Job <760874> is submitted to queue <development>.
    # p = re.compile(r"^(\d+).abe\S+", re.M)
    p = re.compile(r"^Job <(\d+)>.*", re.M)
    m = p.search(output)
    if m != None:
        jobid = m.group(1)
        short_jobid = m.group(1)
        print "jobid=%d" % int(short_jobid)
        log(statusfile, "JOBID is %s\n" % jobid)
        log("./_JOBINFO.TXT", "\nJOBID=%s\n" % jobid)
        return 0
    else:
        print "Error, bsub says: %s" % output
        log(statusfile, "can't get jobid, submit_job is returning 1\n")
        return 1

