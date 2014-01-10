#!/bin/sh
rootdir=$1
basedirs="$rootdir $rootdir/ARCHIVE $rootdir/FAILED"

echo `date` : Running ws_cleanup on cipres_test@triton $1.
echo "Removing job dirs where nothing has been modified in 30 days."


for basedir in $basedirs; do
	for jobdir in $basedir/NGBW-*; do
		echo "jobdir = $jobdir"
		if [ -d $jobdir ]; then

			# Find any files modified recently, skipping "." itself.
			# Important to use mtime (last time data was changed, ignores changes to inode), as
			# shown with ls -lt (ls -lc includes changes to inodes) since we're changing permissions
			# nightly with a cron job.
			new_file_count=`find $jobdir -mindepth 1 -mtime -30 | wc -l`

			# If no young files delete the directory
			if [ $new_file_count -eq 0 ]; then
				echo "Deleting `ls -lstd $jobdir`"
				rm -rf $jobdir
			fi
		fi
	done
done

