#!/bin/ksh
#
# This is the expurgator script to remove old files + dirs from the ngbt area...
# Terri Schwartz or Lucy Chan ought to know the specifics of those directories...(avlg 3/26/2009)
#

echo "Running portal2_test_exp.sh"
export PATH=/usr/local/bin:/usr/bin:/bin

export TESTDIR=/archive/science/ngbt/portal2test
export SDK_VERSIONS=/archive/science/ngbt/portal2test/sdk_versions
export CATALINA_HOME=/users/u3/portal2test/installs/tomcat


#stop the script if this location is not  accessible...
if [ ! -d  $TESTDIR ]; then
	exit 0 
fi
	

cd $TESTDIR/logs
find $TESTDIR/logs -maxdepth 1 -mindepth 1  -name '*.log.20*' -mtime +30 -print0 | xargs -0 rm -rf 
find $TESTDIR/logs -maxdepth 1 -mindepth 1  -name '*access*.txt' -mtime +30 -print0 | xargs -0 rm -rf 
find $TESTDIR/logs/finished_logs -maxdepth 1 -mindepth 1  -type f -mtime +30 -print0 | xargs -0 rm -rf
find $TESTDIR/workspace/sge_jobs -mindepth 1 -mtime +30  -print0 | xargs -0 rm -rf
find $TESTDIR/tmp/treedraw_tmp -mindepth 1 -mtime +1  -print0 | xargs -0 rm -rf 

find $CATALINA_HOME/logs -mtime +30 -name '*.log*' -exec rm {} \;

cd $SDK_VERSIONS
find $SDK_VERSIONS -mtime +30 -exec rm -rf {} \;

