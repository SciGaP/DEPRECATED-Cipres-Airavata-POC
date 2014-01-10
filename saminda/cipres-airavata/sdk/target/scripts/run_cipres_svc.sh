#!/bin/sh


# Log messages for this job will be prefixed with $WB_JOBID in the remote cipres registry, where
# the value of $WB_JOBID is the ngbw/cipres2 job id.  Look for the logs on the cluster on the 
# registry's node, under 
# /scratch/slocal/cipresd/cipres_user_dir/<node>/tmp.
#
# WB_JOBID should be passed by in the environment by SSHProcessWorker, but in case it isn't ...
if test -z "$WB_JOBID"
then
	WB_JOBID="cipres2_job_from";
fi

# set timeout = 72 hrs (4320 minutes) 
# set remote registry to use
# set label that will appear in registry's log
# The rest of the properties for RunServiceApp are passed in from the tool xml file's command line.
cipresclass.sh \
	-Dtimeout=4320 \
	-DremoteRegistry=corbaloc::cipres12.sdsc.edu:5001/CipresRegistry \
	-DgroupLabel="$WB_JOBID"_`hostname` \
	"$@" \
	org.cipres.portal.RunServiceApp

retval=$?
rm -rf ./trees
cat ./done 1>&2
exit $retval 

		
