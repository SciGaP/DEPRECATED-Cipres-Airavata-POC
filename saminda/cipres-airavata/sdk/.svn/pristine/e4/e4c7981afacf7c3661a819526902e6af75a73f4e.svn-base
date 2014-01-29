#!/bin/sh
rootdir=$1
basedirs="$rootdir $rootdir/ARCHIVE $rootdir/FAILED"
HOME=~

echo `date` : Running ws_cleanup on trestles. 
echo "Removing job dirs where nothing has been modified in 14 days." 


for basedir in $basedirs; do
    for jobdir in $basedir/NGBW-*; do
        if [ -d $jobdir ]; then

            # Find any files modified, or accessed recently, skipping "." itself.
			# Important to use mtime (last time data was changed, ignores changes to inode), as
			# shown with ls -lt (ls -lc includes changes to inodes) since we're changing permissions
			# nightly with a cron job.
            # new_file_count=`find $jobdir -mindepth 1 -atime -14 -or -ctime -7 | wc -l`
            new_file_count=`find $jobdir -mindepth 1 -mtime -14 | wc -l`

            # If no young files delete the directory
            if [ $new_file_count -eq 0 ]; then
                echo "Deleting $jobdir" 
				rm -rf $jobdir 
            fi
        fi
    done
done
echo



