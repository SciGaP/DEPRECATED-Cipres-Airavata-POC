#!/usr/bin/env python
import test_lib as lib
import sys
import os

def main(argv=None):
    """
    Usage is:
    submit.py [id=<chargecode>] <url> <commandline>
    Run from the working dir of the job which must contain (in additoin
    to the job files) a file named scheduler.conf with scheduler properties for the job.

    id=<chargecode> if present gives the project id to charge the job to.
    Url is url of the submitting website including taskid parameter.

    Returns 0 with "jobid=<jobid>" on stdout if job submitted ok
    Returns 1 with multiline error message on stdout if error.
    Returns 2 for the specific error of queue limit exceeded.
    """
    if argv is None:
        argv=sys.argv
    scheduler_properties = lib.getProperties("scheduler.conf")
    # print scheduler_properties
    scheduler_info = lib.schedulerInfo(scheduler_properties)
    # print scheduler_info


    splits = argv[1].split("=", 1)
    if (len(splits) == 2 and splits[0] == "id"):
        account = splits[1]
        url = argv[2]
        cmdline = argv[3:]
    else:
        account = lib.account
        url = argv[1]
        cmdline = argv[2:]

    if scheduler_info["is_mpi"]:
        rfile = open(lib.cmdfile, "w") 
        rfile.write("#!/bin/sh\n")
        rfile.writelines((" ".join(cmdline), "\n"))
        rfile.close()
        os.chmod(lib.cmdfile, 0744);

    rfile = open(lib.runfile, "w") 

    text = """#!/bin/sh
#BSUB -q %s 
#BSUB -J %s 
#BSUB -W %d 
#BSUB -o stdout.txt 
#BSUB -e stderr.txt
#BSUB -P %s 
""" % (scheduler_info["queue"], lib.jobname, scheduler_info["runtime"], account)
    rfile.write(text)

    if scheduler_info["is_mpi"]:
        text = "#BSUB -n %d\n" % scheduler_info["mpi_processes"]
        rfile.write(text)
        text = "#BSUB -R 'span[ptile=%d]'" % scheduler_info["ppn"]
        rfile.write(text)
        text = """
echo Job starting at `date` > start.txt
ssh tg-login.lonestar.tacc.teragrid.org "source ~/.profile_user; curl %s\&status=START"
ibrun %s
echo Job finished at `date` > done.txt
ssh tg-login.lonestar.tacc.teragrid.org "source ~/.profile_user; curl %s\&status=DONE"
""" % ( url, lib.cmdfile, url)
        rfile.write(text)

    else:
        text = "#BSUB -n %d\n" % lib.cores_per_node
        rfile.write(text)
        text = """
echo Job starting at `date` > start.txt
ssh tg-login.lonestar.tacc.teragrid.org "source ~/.profile_user; curl %s\&status=START"
%s
echo Job finished at `date` > done.txt
ssh tg-login.lonestar.tacc.teragrid.org "source ~/.profile_user; curl %s\&status=DONE"
""" % (url, " ".join(cmdline)  , url)
        rfile.write(text)

    rfile.close()

    return lib.submitJob()
    return 0

if __name__ == "__main__":
    sys.exit(main())



