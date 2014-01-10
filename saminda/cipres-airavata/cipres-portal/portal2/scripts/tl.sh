#!/bin/bash

# CHANGE -denv=cipres-dev AS NEEDED before you run this.


export JAVA_OPTS="$JAVA_OPTS -Dlog4jdbc.debug.stack.prefix=org.ngbw -Dlog4jdbc.sqltiming.warn.threshold=40 -Dlog4jdbc.sqltiming.error.threshold=40 "

if [ -z "$SDK_VERSIONS" ]; then
	echo you need to set the env var SDK_VERSIONS
	exit 1
fi



deploy_sdk()
{
	# make sure the path we just deployed to is what we'll run we say "loadResultsD or piseEval".
	if [ "`which loadResultsD`" !=  "$SDK_VERSIONS/loadResultsD" ]; then
		echo "Path should be configured such that 'loadResultsD' executes $SDK_VERSIONS/loadResultsD"
		echo "but 'which loadResultsD' returns `which loadResultsD`."
		return 1
	fi
	if [ "`which piseEval`" !=  "$SDK_VERSIONS/piseEval" ]; then
		echo "Path should be configured such that 'piseEval' executes $SDK_VERSIONS/piseEval"
		echo "but 'which piseEval' returns `which piseEval`."
		return 1
	fi
	checkJobsD restart
	loadResultsD restart
	submitJobD restart
	recoverResultsD restart
	return 0
}

$CATALINA_HOME/bin/shutdown.sh

# TODO: portal.url and  job.callback.url in cipres-*.properties need to be different
# depending on whether you are utimately targeting the rest app or the cipres-portal.
# Should we modify these files before building the sdk?

if [ "$1" == "skipsdk" ] ; then
	MVNARGS=-DSKIPSDK
fi
	
# Build everything that we're going to build
mvn -Denv=cipres-dev -Diplant=1 $MVNARGS clean install
retval1=$?
if [ $retval1 != 0 ]; then
	echo build failure;
	exit 1;
fi

if [ "$1" != "skipsdk" ] ; then
	deploy_sdk
fi

if [ $? -eq 0 ]; then
	echo ==========================================
	echo deployed standalone sdk OK
	echo ==========================================
else
	echo ==========================================
	echo error deploying standalone sdk
	echo ==========================================
	exit 1
fi


echo ==========================================
echo Deploying web applications
echo ==========================================
rm -rf $CATALINA_HOME/work

# cipres-portal
rm -rf $CATALINA_HOME/webapps/portal2 $CATALINA_HOME/webapps/portal2.war 
cp ../portal2/target/portal2.war $CATALINA_HOME/webapps

$CATALINA_HOME/bin/startup.sh
