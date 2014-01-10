#!/bin/sh
# Run this from cron to truncate gram log files in the home directory
# so we don't exceed our disk quota.  Finds all gram log files larger
# than 16k and truncates to their first 200 lines.  The find command
# will keep updating access time of the log files so it's important
# that ws_cleanup.sh removes them based on ctime, or mtime, not atime.

date
echo checking disk quota
quota
echo pruning logs
find $HOME -maxdepth 1 -name gram_job_mgr_\*.log -size +16k -exec sh -c 'echo pruning {}; head -n +200 {} > $HOME/gram.log.tmp; cat $HOME/gram.log.tmp > {}; '  \; 
