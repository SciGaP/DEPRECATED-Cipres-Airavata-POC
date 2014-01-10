#!/bin/ksh

PATH=/opt/SUNWsamfs/bin:/opt/SUNWsamfs/sbin:/usr/local/bin:/usr/bin:/bin
export PATH

TESTDIR=/archive/science/ngbt/portal2test
export TESTDIR

PRODDIR=/archive/science/ngbt/portal2prod
export PRODDIR

#
#This is to remove all the old timestamped logfiles...
#
#

cd $TESTDIR/logs

sfind . -maxdepth 1 -name '*.log.2*' -atime +90 -print | xargs /bin/rm

cd $PRODDIR/logs

sfind . -maxdepth 1 -name '*.log.2*' -atime +90 -print | xargs /bin/rm

#
#Find only regular files, only in this directory more than 90 days old, and remove 'em.
#

cd $TESTDIR/logs/finished_jobs

sfind . -maxdepth 1 -type f -atime +90 -print | xargs /bin/rm

cd $PRODDIR/logs/finished_jobs

sfind . -maxdepth 1 -type f -atime +90 -print | xargs /bin/rm

#
#Here we're removing any subdirs under the ARCHIVE or FAILED dirs older than 3 months... 
#

cd $TESTDIR/workspace/bwbatch/ARCHIVE

sfind . -type d -atime +90 -print | xargs /bin/rm -rf 

cd $TESTDIR/workspace/sge_jobs/ARCHIVE

sfind . -type d -atime +90 -print | xargs /bin/rm -rf

cd $TESTDIR/workspace/bwbatch/FAILED

sfind . -type d -atime +90 -print | xargs /bin/rm -rf

cd $TESTDIR/workspace/sge_jobs/FAILED

sfind . -type d -atime +90 -print | xargs /bin/rm -rf

#
#repeat for the proddirs...
#

cd $PRODDIR/workspace/bwbatch/ARCHIVE

sfind . -type d -atime +90 -print | xargs /bin/rm -rf

cd $PRODDIR/workspace/sge_jobs/ARCHIVE

sfind . -type d -atime +90 -print | xargs /bin/rm -rf

cd $PRODDIR/workspace/bwbatch/FAILED

sfind . -type d -atime +90 -print | xargs /bin/rm -rf

cd $PRODDIR/workspace/sge_jobs/FAILED

sfind . -type d -atime +90 -print | xargs /bin/rm -rf

#
#...now we clean in /tmp/treedraw, looking for files or directories older than twelve hours...
#
#
 
cd $TESTDIR/tmp/treedraw

sfind . -amin +720 -print | xargs /bin/rm -rf

cd $PRODDIR/tmp/treedraw

sfind . -amin +720 -print | xargs /bin/rm -rf

#
#...and now we send some disk reports...
#
#
today=`date '+%m%d%y'`
touch /tmp/portal2_count.$today

if [ ! -r /archives/science/ngbt ]
then
	echo "SAM-QFS not accessible" >> /tmp/portal2_count.$today
else
	echo "The amount of space used as of $(date) is:" >> /tmp/portal2_count.$today
	echo "........................................." >> /tmp/portal2_count.$today
	echo "In Production..." >> /tmp/portal2_count.$today
	cd $PRODDIR
	sdu -sh . >> /tmp/portal2_count.$today
	echo "........................................." >> /tmp/portal2_count.$today
	subdirs=`ls -d /archive/backups/ngbt/portal2prod/*`
		for var in $subdirs ; do
			sdu -sh $var >> /tmp/portal2_count.$today
		done
	echo "In Testing..." >> /tmp/portal2_count.$today
	cd $TESTDIR
	sdu -sh . >> /tmp/portal2_count.$today
	echo "........................................." >> /tmp/portal2_count.$today
	subdirs=`ls -d /archive/backups/ngbt/portal2test/*`
                for var in $subdirs ; do
                        sdu -sh $var >> /tmp/portal2_count.$today
                done
fi

cat /tmp/portal2_count.$today | /bin/mailx -s "portal2 space count" terri@ad.sdsc.edu avlg 
