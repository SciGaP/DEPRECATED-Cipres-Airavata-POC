#!/bin/sh
# This is a generic job wrapper that we invoke for all tasks from cipres portal, passing
# in the pise generated command line.  For example, for mrbayes_teragrid, the command
# that's run here will be: "wrap.sh mbwrapper paramfile.txt", where mrbwrapper 
# handles the tool specific issue of presenting paramfile.txt on stdin to mb-mpi.


source ~/.bash_profile
RANK="$OMPI_COMM_WORLD_RANK"
SCHED_JOBID="$PBS_JOBID"
GRAM_JOBID="$GLOBUS_GRAM_JOB_CONTACT"

if [ "$RANK" ==  "" ] || [ $RANK -eq 0 ] ; then
	echo start_time=`date` > start.txt
        echo >> _JOBINFO.TXT
        echo SCHED_JOBID=${SCHED_JOBID} >> _JOBINFO.TXT
        echo GRAM_JOBID=${GRAM_JOBID} >> _JOBINFO.TXT
fi

# Run the command
$*
status=$?

if [ "$RANK" ==  "" ] || [ $RANK -eq 0 ] ; then
	echo end_time=`date` > done.txt
        echo exit_code=$status >> done.txt
fi


