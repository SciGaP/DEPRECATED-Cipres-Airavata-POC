#!/bin/sh
# Expects a list of jobs on stdin, one per line.
# Returns on stdout, the subset of those jobs that are no longer running or queued.

source $CIPRES_SCRIPT/job_wrapper.sh

input=
while read myline
do
	input="$input$myline\\n"
done

# Use qstat to get a list of jobs that ARE still running or queued.
user=`whoami`
output=`qstat | grep $user` 
# eliminate rows where status (2nd to last column) is "C" and only keep the jobids.
# output=`echo "$output" | perl -lane 'if ( $_ !~ /\S+.+\s+C\s+\S+\s*$/) { print $F[0]}'`

# Same as above but truncates all but numeric portion of jobid since triton seems to 
# keep reconfiguring what qstat shows of jobid.
output=`echo "$output" | perl -lane 'if (( $_ !~ /\S+.+\s+C\s+\S+\s*$/) && ( $F[0] =~ /(\d+)\.triton-.+/ )) { print $1;  }'`


# To return a list of jobs that are finished we only want the lines from input
# that aren't in output.

# These are the lines that appear in both our input list and qstat, i.e.jobs that are still running
# uniq -d only prints lines that are duplicated.
running=`echo -e "$input$output" | sort | uniq -d`


# These are the lines from input that aren't still running or queued. 
# uniq -u only prints lines that aren't duplicated.
echo -e "$input$running" | sort | uniq -u






