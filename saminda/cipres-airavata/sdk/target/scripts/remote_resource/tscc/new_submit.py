#!/usr/bin/env python
# import test_lib as lib
import lib
import sys
import os

def main(argv=None):
    """
    Usage is:
    submit.py [id=<chargecode>] <url> <commandline> 
    Run from the working dir of the job which must contain (in additoin
    to the job files) a file named scheduler.conf with scheduler properties for the job.

    id=<chargecode> if present gives the project to charge the job to.
    Url is url of the submitting website including taskid parameter.

    Returns 0 with "jobid=<jobid>" on stdout if job submitted ok
    Returns 1 with multiline error message on stdout if error.
    Returns 2 for the specific error of queue limit exceeded.
    """
    if argv is None:
        argv=sys.argv

    splits = argv[1].split("=", 1)
    if (len(splits) == 2 and splits[0] == "id"):
        account = splits[1]
        url = argv[2]
        cmdline = argv[3:]
    else:
        account = lib.account 
        url = argv[1]
        cmdline = argv[2:]
    tooltype = lib.getToolType(cmdline)

    scheduler_properties = lib.getProperties("scheduler.conf")
    # print scheduler_properties
    scheduler_info = lib.schedulerInfo(scheduler_properties, tooltype)
    # print scheduler_info

    runtime = int(scheduler_info["runtime"])

    # Write the command line to a file, batch_command.cmdline.
    rfile = open(lib.cmdfile, "w") 
    rfile.write("#!/bin/sh\n")
    rfile.writelines((" ".join(cmdline), "\n"))
    rfile.close()
    os.chmod(lib.cmdfile, 0744);


    # Create the qsub script
    rfile = open(lib.runfile, "w") 

    text = """#!/bin/sh
#PBS -q %s
#PBS -N %s
#PBS -l walltime=00:%d:00
#PBS -o scheduler_stdout.txt
#PBS -e scheduler_stderr.txt
#PBS -W umask=0007
##PBS -V
#PBS -M  %s
#PBS -m ae
#PBS -A %s
""" % (scheduler_info["queue"], lib.jobname,  scheduler_info["runtime"], lib.email, account)
    rfile.write(text)

    rfile.write("cd %s\n" % (lib.jobdir))
    text = """
source /etc/profile.d/modules.sh
echo Job starting at `date` > start.txt
curl %s\&status=START
export CIPRES_THREADSPP=%d
export CIPRES_NP=%d
%s 1>stdout.txt 2>stderr.txt
echo Job finished at `date` > done.txt
""" % (url, 
        int(scheduler_info["threads_per_process"]), 
        int(scheduler_info["ppn"]) * int(scheduler_info["nodes"]),
        lib.cmdfile)
    rfile.write(text)
    rfile.write("curl %s\&status=DONE\n" %  url)
    rfile.close()

    return lib.submitJob()
    return 0

if __name__ == "__main__":
    sys.exit(main())



