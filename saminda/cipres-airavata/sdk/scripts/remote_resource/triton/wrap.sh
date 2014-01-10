#!/bin/sh

source $CIPRES_SCRIPT/job_wrapper.sh

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
#PBS -m ae 
#PBS -A $ACCOUNT 
#PBS -d $JOBDIR

$*

EOF

submit_job
if [ $? -ne 0 ]; then
	echo "submit_job failed, leaving" >> $STATUSFILE
	exit 1
fi
echo "submit_job ok" >> $STATUSFILE

until  job_finished $JOBID 
do
	sleep 10 
done

