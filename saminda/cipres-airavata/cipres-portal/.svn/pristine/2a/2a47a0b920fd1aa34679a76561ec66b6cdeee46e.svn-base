#!/bin/sh
# Run this from ~Documents/wb_new/web to build and deploy the workbench web app.

SS_ROOT=~/ss_server
SS_SERVER=$SS_ROOT/ss_control

# For development builds, it's ok to kill the socketserver logger since we don't have
# running jobs that we care about that may still be logging.
$CATALINA_HOME/bin/shutdown.sh
# $SS_SERVER stop

(cd ../sdk && mvn -Denv=cipres-dev clean install)
retval3=$?
if [ $retval3 != 0 ]; then
	echo build SDK failure;
	exit 1;
fi


mvn -Denv=cipres-dev clean install
retval=$?
if [ $retval != 0 ]; then
	echo build failure;
	exit 1;
fi

diff -r $SS_ROOT target/ss_server
if [ $? != 0 ]; then
	echo "$SS_ROOT is different from target/ss_server."
	echo "Chances are you changed the port or the log file directory in cipres-portal/profile.xml "
	echo "or one of the files in src/main/ss_server."
	echo "ARE RUNNING JOBS USING THE SERVER STARTED FROM $SS_ROOT ?  If so, rename $SS_ROOT."
	echo "Then, to continue with this build, manually copy target/ss_server to $SS_ROOT and run this script again."
	exit 1
fi

# rm $CATALINA_HOME/logs/catalina.out
# rm $CATALINA_HOME/logs/sdk*log*  $CATALINA_HOME/logs/tools.log  $CATALINA_HOME/logs/portal2.log  $CATALINA_HOME/logs/all-portal2.log
rm -rf $CATALINA_HOME/webapps/portal2 $CATALINA_HOME/webapps/portal2.war $CATALINA_HOME/work

date_str=`date +%F-%T`
appname=portal2-$date_str.war
cp target/portal2.war $CATALINA_HOME/portal2-versions/$appname

$SS_SERVER start
if [ $? = 0 ]; then
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"	
	echo "Edit CATALINA_HOME/conf/server.xml and set docbase for Context"
	echo "to portal-versions/$appname. Then start tomcat by running"
	echo "CATALINA_HOME/bin/startup.sh."
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"	
# $CATALINA_HOME/bin/startup.sh
else
	echo error starting socket server
fi
