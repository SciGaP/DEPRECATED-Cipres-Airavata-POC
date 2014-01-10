#!/bin/sh
# Returns 0, with "jobid=<jobid>" on stdout, if job submitted.
# Returns 1, with multiline error message on stdout otherwise.
#
# This is invoked as:
#	submit.sh url 'commandline'
# If we wanted to set scheduler options, we'd pass them in before the url as a
# single argument and give them to set_scheduler_options, then shift. 

source $CIPRES_SCRIPT/job_wrapper.sh

URL=$1
shift
set_scheduler_options 

cat > $RUNFILE << EOF
#!/bin/sh

#PBS -q $QUEUE
#PBS -N $JOBNAME 
#PBS -l walltime=$RUNTIME:00 
#PBS -o stdout.txt 
#PBS -e stderr.txt
#PBS -V
#PBS -M  $EMAIL
##PBS -m ae 
#PBS -A $ACCOUNT 
#PBS -d $JOBDIR


echo Job starting at `date` > start.txt
curl $URL\&status=START
$*
echo Job finished at `date` > done.txt
curl $URL\&status=DONE

EOF

submit_job
exit $?
