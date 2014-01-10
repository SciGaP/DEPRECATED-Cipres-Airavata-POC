#!/bin/sh
WORK=/work/01205/cipres
HOME=/home/01205/cipres
rootdir=$WORK/ngbw/workspace
basedirs="$rootdir $rootdir/ARCHIVE $rootdir/FAILED"

echo `date` : Running ws_cleanup on LONESTAR. 
echo "Removing job dirs where nothing has been modified in 7 days."


for basedir in $basedirs; do
	for jobdir in $basedir/NGBW-*; do
		if [ -d $jobdir ]; then

			# Find any files modified, or accessed recently, skipping "." itself.
			# new_file_count=`find $jobdir -mindepth 1 -atime -7 -or -ctime -7 | wc -l`

			new_file_count=`find $jobdir -mindepth 1 -ctime -7 | wc -l`

			# If no young files delete the directory
			if [ $new_file_count -eq 0 ]; then
				echo "Deleting $jobdir" 
				rm -rf $jobdir
			fi
		fi
	done
done
echo

# Remove old .lsf* and gram_job_mgr files from home directory.
find $HOME  -name .lsf\* -maxdepth 1 -ctime +15 -exec rm {} \;
find $HOME  -name gram_job_mgr\* -maxdepth 1 -ctime +15 -exec rm {} \;
find $HOME/.globus/job/*lonestar*  -maxdepth 1 -ctime +15 -exec rm -rf {} \;

