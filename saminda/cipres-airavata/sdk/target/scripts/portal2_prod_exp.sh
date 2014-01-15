#!/bin/bash
export PATH=/usr/local/bin:/usr/bin:/bin
echo "Running portal2_prod_exp.sh"

export DIR=/archive/science/ngbt/portal2prod
export CATALINA_HOME=/fs/install-workspace/tomcat
export DIR2=/fs/portal2prod
export SDK_VERSIONS=/archive/science/ngbt/portal2prod/sdk_versions


#stop the script if this location is not  accessible...
if [ ! -d  $DIR ]; then
	echo "Quitting. Cant access $DIR"
	exit 0
fi
if [ ! -d  $CATALINA_HOME ]; then
	echo "Quitting. Cant access $CATALINA_HOME"
	exit 0
fi
if [ ! -d  $DIR2 ]; then
	echo "Quitting. Cant access $DIR2"
	exit 0
fi

echo "Removing old files under $DIR"
find $DIR/logs -name '*.log.20*' -mtime +30 -type f -exec rm -fv {} \;
find $DIR/logs/finished_logs -mtime +30 -type f -exec rm -fv {} \;
# find $DIR/tmp/treedraw  -mtime +1 -type d -exec rm -rfv {} \;

echo "Removing old files under $DIR2"
find $DIR2/logs -name '*.log.20*' -mtime +30 -type f -exec rm -fv {} \;
find $DIR2/logs/finished_logs -mtime +30 -type f -exec rm -fv {} \;
# find $DIR2/tmp/treedraw -mtime +1 -type d -exec rm -rfv {} \;

echo "Removing old files under $CATALINA_HOME"
find $CATALINA_HOME/logs -mtime +90 -name '*.20*' -type f -exec rm -fv {} \;

# sdk_versions aren't removed automatically because it seems too hard to 
# figure out who to make sure we don't remove the current version.
echo
echo "Consider removing old versions from $SDK_VERSIONS:"
find $SDK_VERSIONS -maxdepth 1 -mtime +60 -print 


