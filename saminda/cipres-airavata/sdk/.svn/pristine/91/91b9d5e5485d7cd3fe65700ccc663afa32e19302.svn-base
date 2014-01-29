#!/bin/sh
# Expects jobid on the command line.
# Returns 0 if job is finished (or qstat doesn't know about the job), 1 if still queued, deferred, etc.

source $CIPRES_SCRIPT/job_wrapper.sh

job_finished $1
retval=$?

echo $STATUS

exit $retval

