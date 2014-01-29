#!/usr/bin/env python
import lib_v2 as lib
import sys
import os

def main(argv=None):
	"""
    Usage is:
    submit.py [--account <chargecode>] [--url <url>] -- <commandline> 
    Run from the working dir of the job which must contain (in addition
    to the job files) a file named scheduler.conf with scheduler properties for the job.
    
    <chargecode>, if present, gives the project to charge the job to.
    Url is the url of the submitting website including the taskid parameter.
	
	Returns 0 with "jobid=<jobid>" on stdout if job submitted ok
	Returns 1 with multiline error message on stdout if error.
	Returns 2 for the specific error of queue limit exceeded.
	"""
	
	#COMMAND LINE PARSING
	import argparse
	parser = argparse.ArgumentParser()
	parser.add_argument('--account', metavar="ACCOUNT", type=str, default=lib.account,
		help="The account string to use when submitting jobs. Default is read from config files.")
	
	parser.add_argument('--url', metavar="URL", dest="URL", type=str,
                    help="Notification URL")
    
	try:
		cmdline_options, cmdline = parser.parse_known_args(argv)
		cmdline = cmdline[1:] if not ('--' in cmdline) else cmdline[cmdline.index('--')+1:]
	except Exception as e:
		print "There was a problem submitting your job"
		print e
		sys.exit(1)
	
	account = cmdline_options.account
	url     = cmdline_options.URL
	#cmdline as an array (and already set)
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



