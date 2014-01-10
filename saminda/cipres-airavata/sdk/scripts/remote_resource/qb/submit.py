#!/usr/bin/env python
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
        rfile.write("# See ~Readme.txt\n");
        rfile.write("source $HOME/ngbw/contrib/scripts/workbench.rc\n");
        rfile.writelines((" ".join(cmdline), "\n"))
        rfile.close()
        os.chmod(lib.cmdfile, 0744);

    rfile = open(lib.runfile, "w") 

    text = """#!/bin/sh
#PBS -q %s 
#PBS -N %s 
#PBS -l walltime=%d:00 
#PBS -o stdout.txt 
#PBS -e stderr.txt
#PBS -k oe
#PBS -V
#PBS -M  %s 
##PBS -m ae 
#PBS -A %s 
""" % (scheduler_info["queue"], lib.jobname,  scheduler_info["runtime"], lib.email, account)
    rfile.write(text)

    if scheduler_info["is_mpi"]:
        text = "# ppn=8 may be changed below via special qb hack\n"
        rfile.write(text)
        text = "#PBS -l nodes=%d:ppn=8\n" % (scheduler_info["nodes"])
        rfile.write(text)

        text = """
cd %s
rm -f pbs_tempfile pbs_tempfile2 pbs_newmachinefile
cat $PBS_NODEFILE | sort | uniq >> pbs_tempfile
""" % (lib.jobdir)
        rfile.write(text)

        for ppnCount in range(scheduler_info["ppn"]):
            rfile.write("cat pbs_tempfile >> pbs_tempfile2\n") 

        text = """
cat pbs_tempfile2 | sort > pbs_newmachinefile   
export NPROCS=`wc -l pbs_newmachinefile |gawk '//{print $1}'`
echo Job starting at `date` > start.txt
curl %s\&status=START
mpirun -v -machinefile pbs_newmachinefile -np $NPROCS %s < /dev/null
echo Job finished at `date` > done.txt
curl %s\&status=DONE
""" % (url, lib.cmdfile, url)
        rfile.write(text)

    else:

        text = """
cd %s
echo Job starting at `date` > start.txt
curl %s\&status=START
%s
echo Job finished at `date` > done.txt
curl %s\&status=DONE
""" % (lib.jobdir, url, " ".join(cmdline)  , url)
        rfile.write(text)

    rfile.close()

    return lib.submitJob()
    return 0

if __name__ == "__main__":
    sys.exit(main())



