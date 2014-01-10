#!/bin/bash
#
# This is the expurgator script to remove old files + dirs from the ngbt area...
# Terri Schwartz or Lucy Chan ought to know the specifics of those directories...(avlg 3/26/2009)
#

export PATH=/usr/local/bin:/usr/bin:/bin


echo "Running portal2_prod_exp.sh"
export PATH=/usr/local/bin:/usr/bin:/bin

export DIR=/archive/science/ngbt/portal2prod
export SDK_VERSIONS=/archive/science/ngbt/portal2prod/sdk_versions
export CATALINA_HOME=/fs/cipres/install-workspace/tomcat


#stop the script if this location is not  accessible...
if [ ! -d  $DIR ]; then
	echo "Quitting. Cant access $DIR"
	exit 0
fi


cd $DIR/logs
find $DIR/logs -maxdepth 1 -mindepth 1  -name '*.log.20*' -mtime +30 -print0 | xargs -0 rm -rf
find $DIR/logs -maxdepth 1 -mindepth 1  -name '*access*.txt' -mtime +30 -print0 | xargs -0 rm -rf
find $DIR/logs/finished_logs -maxdepth 1 -mindepth 1  -type f -mtime +30 -print0 | xargs -0 rm -rf
find $DIR/workspace/sge_jobs -mindepth 1 -mtime +30  -print0 | xargs -0 rm -rf
find $DIR/tmp/treedraw_tmp -mindepth 1 -mtime +1  -print0 | xargs -0 rm -rf

find $CATALINA_HOME/logs -mtime +30  -exec rm {} \;

# sdk_versions aren't removed automatically because it seems too hard to 
# figure out who to make sure we don't remove the current version.
echo
echo "Consider removing old versions from $SDK_VERSIONS:"
find $SDK_VERSIONS -maxdepth 1 -mtime +60 -print 


