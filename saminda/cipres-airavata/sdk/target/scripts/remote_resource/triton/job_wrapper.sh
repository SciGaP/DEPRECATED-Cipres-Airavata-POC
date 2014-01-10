# Wrappers for individual tools should source this file first
ACCOUNT=cipres_test

# Look for runhours  and other scheduler properties in this file.
SCHEDULER_FILE=scheduler.conf

# Info about this machine's architecture and batch queues 
CORES_PER_NODE=8

# max runtime is 72 hours, node is shared with other jobs
SMALL_Q=small
SMALL_Q_RUNTIME=4320

DEFAULT_JOBNAME=cipres

# User information
EMAIL=terri@sdsc.edu
PROJECT=

# JobId should be passed in the environment from the web application.
if [ -z "$WB_JOBID" ] ; then
	JOBNAME=$DEFAULT_JOBNAME
else
	JOBNAME="$WB_JOBID"
fi

# Assumes we cd to the working dir before running this script.
JOBDIR=`pwd`

RUNFILE=./batch_command.run
STATUSFILE=./batch_command.status

# For the time being we are only handling serial jobs in the small queue.
# Todo: should be getting scheduler options from a file named scheduler.conf
# Todo: modify cipres ui to always ask for run hours in the job creation form.
set_scheduler_options()
{
	RUNTIME=
	QUEUE=$SMALL_Q
	if [ -f $SCHEDULER_FILE ]; then
		# RUNTIME=`cat $SCHEDULER_FILE | perl -ne 'if ( $_ =~ /runhours=(\d*\.?\d*).*/ ) { print $1 * 60; exit }'`
		# RUNTIME=`cat $SCHEDULER_FILE | perl -ne 'if ( $_ =~ /runhours=(\d*\.?\d*).*/ ) { print int($1 * 60) + 1; exit }'`
		RUNTIME=`cat $SCHEDULER_FILE | perl -ne 'use POSIX; if ( $_ =~ /runhours=(\d*\.?\d*).*/ ) { print ceil($1 * 60); exit }'`
	fi
	if [ -z "$RUNTIME" ] ; then
		RUNTIME=$SMALL_Q_RUNTIME
	fi
	if [ $RUNTIME -gt $SMALL_Q_RUNTIME ] ; then
		RUNTIME=$SMALL_Q_RUNTIME
	fi
	cpu_count=1
}

submit_job()
{
	echo mypid is $$, hostname is `hostname` > $STATUSFILE

	# Capture stdout in $output, send stderr to STATUSFILE.  
	output=`qsub  $RUNFILE 2>>$STATUSFILE`
	retval=$?
	if [ $retval -ne 0 ]; then
		echo error submitting job: 
		cat $STATUSFILE
		echo " " 
		echo $output

		if [ $retval -eq 226 ]; then
			retval=2
		fi
		echo "submit_job is returning $retval" >> $STATUSFILE
		return $retval
	fi
	echo "qsub output is:" >> $STATUSFILE
	echo >> $STATUSFILE
	echo $output >> $STATUSFILE
	echo ======================================================================================= >> $STATUSFILE
	JOBID=$output
	SHORT_JOBID=`echo "$output" | perl -ne 'if ( $_ =~ /(\d+)\.triton-.+/ ) { print $1; exit }'`

	# Hmm, it must have said something else.
	if [ -z "$SHORT_JOBID" ];  then
		echo Error, qsub says: $output
		echo "can't get jobid, submit_job is returning 1" >> $STATUSFILE
		return 1
	fi
	echo "submit_job is returning 0, jobid is $JOBID and short jobid is $SHORT_JOBID" >> $STATUSFILE

	# We expect this one line on stdout when the method returns 0.
	# echo "jobid=$JOBID"
	echo "jobid=$SHORT_JOBID"
	return 0
}

# Pass in job id of interest when calling this
# Returns 0 if job is finished, 1 if its running, pending, etc.
# sets STATUS to whatever status code we can get and writes STATUS to status file. 
job_finished()
{
	STATUS="unknown"
	echo ======================================================================================= >> $STATUSFILE

	# stdout should have a line of column headers followed by a line with the 
	# job info (followed by extra lines if multiple hosts are used).  Columns are:
	# JOBID NAME USER TIME STATUS QUEUE
	JOBID=$1
	SHORT_JOBID=`echo "$JOBID" | perl -ne 'if ( $_ =~ /(\d+)\.triton-.+/ ) { print $1; exit }'`
	output=`qstat $JOBID 2>&1`
	echo "$output" >> $STATUSFILE

	# qstat doesn't think the job is running,  return 0.
	echo "$output" | grep "Unknown Job" 2>&1 > /dev/null  
	if [ $? -eq 0 ] ; then
		# check_hist $JOBID
		return 0 
	fi
	# Parse job status from output of qstat.  If "C" = completed, return 0.
	STATUS=`echo "$output" | perl -ne 'if ( $_ =~ /'$SHORT_JOBID'\S+\s+\S+\s+\S+\s+\S+\s+(\w+).*/) { print $1; exit }'`
	if [ "$STATUS" = "C" ]; then
		return 0
	fi
	echo STATUS is $STATUS. >> $STATUSFILE
	return 1
}


# To do: not currently used.
check_hist()
{
	echo ======================================================================================= >> $STATUSFILE
	JOBID=$1
	HIST=`glsjob $SHORT_JOBID`
	echo "$HIST" >> $STATUSFILE
}

