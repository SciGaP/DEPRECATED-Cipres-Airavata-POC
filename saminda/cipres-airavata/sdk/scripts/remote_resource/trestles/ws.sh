#!/bin/sh
rootdir=$1
basedirs="$rootdir $rootdir/ARCHIVE $rootdir/FAILED"
HOME=~

echo `date` : Running ws_cleanup on trestles. 
echo "Removing job dirs where nothing has been modified in 14 days." 


for basedir in $basedirs; do
	echo "Processing $basedir"
    for jobdir in $basedir/NGBW-*; do
		echo "jobdir = $jobdir"
        if [ -d $jobdir ]; then

            # Find any files modified, or accessed recently, skipping "." itself.
            # new_file_count=`find $jobdir -mindepth 1 -atime -14 -or -ctime -7 | wc -l`

            # Find any files modified recently, skipping "." itself.
            new_file_count=`find $jobdir -mindepth 1 -ctime -14 | wc -l`
			echo "new_file_count in $jobdir is $new_file_count"

            # If no young files delete the directory
            if [ $new_file_count -eq 0 ]; then
                echo "Deleting $jobdir" 
				rm -rf $jobdir 
            fi
        fi
    done
done
echo



