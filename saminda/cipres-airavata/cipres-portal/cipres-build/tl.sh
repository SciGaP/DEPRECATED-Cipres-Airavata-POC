#!/bin/bash

export JAVA_OPTS="$JAVA_OPTS -Dlog4jdbc.debug.stack.prefix=org.ngbw -Dlog4jdbc.sqltiming.warn.threshold=40 -Dlog4jdbc.sqltiming.error.threshold=40 "
if [ -z "$SDK_VERSIONS" ]; then
	echo you need to set the env var SDK_VERSIONS
	exit 1
fi

target=portal
mode=dev
skipsdk=false

OPTIND=1
while getopts ":t:m:sh" opt; do
    case "$opt" in
    h)
		echo "Optional arguments are: -t target, -m mode, -s"
		echo "where target is one of: rest  portal or both"
		echo "mode is: dev, test or prod"
		echo "-s means skip building the sdk, I already built and deployed it"
        exit 0
        ;;
    t) 
		if [[ "$OPTARG" != "rest" && "$OPTARG" != "portal" && "$OPTARG" != "both" ]]; then
			echo "Invalid -t argument"
			exit 1
		fi
		target=$OPTARG
        ;;
    m)  
		if [[ "$OPTARG" != "dev" && "$OPTARG" != "test" && "$OPTARG" != "prod" ]]; then
			echo "Invalid -m argument"
			exit 1
		fi
		mode=$OPTARG
        ;;
    s)  
		skipsdk=true
        ;;
	\?)
		echo "Invalid option: -$OPTARG"
		exit 1
		;;
	:)
		echo "Option -$OPTARG requires an argument"
		exit 1
		;;
    esac
done


case "$target" in
	rest)
		MVNARGS=-DREST
		;;
	portal)
		MVNARGS=-DPORTAL
		;;
	both)
		MVNARGS=-"DBOTH"
		;;
esac
if [[ "$skipsdk" == "false" ]] ; then
	MVNARGS="$MVNARGS -DSDK"
fi


echo "target = $target"
echo "mode = $mode"
echo "MVNARGS = $MVNARGS"
echo "skipsdk = $skipsdk"
echo "mvn command: mvn -Denv=cipres-$mode -Diplant=1 $MVNARGS clean install"
# exit 0
#####


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


# Build everything that we're going to build
mvn  -Denv=cipres-$mode -Diplant=1 $MVNARGS clean install
retval1=$?
if [ $retval1 != 0 ]; then
	echo build failure;
	exit 1;
fi

if [ "$skipsdk" == "false" ] ; then
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

rm -rf $CATALINA_HOME/webapps/portal2 $CATALINA_HOME/webapps/portal2.war 
rm -rf $CATALINA_HOME/webapps/cipresrest $CATALINA_HOME/webapps/cipresrest.war 
rm -rf $CATALINA_HOME/webapps/restclient $CATALINA_HOME/webapps/restclient.war 

if [[ "$target" == "portal" || "$target" == "both" ]] ; then 
	cp ../portal2/target/portal2.war $CATALINA_HOME/webapps
	echo Deployed portal2
fi

if [[ "$target" == "rest" || "$target" == "both" ]] ; then 
	cp ../cipres-rest-service/cipresrest/target/cipresrest.war $CATALINA_HOME/webapps
	cp ../cipres-rest-service/restclient/target/restclient.war $CATALINA_HOME/webapps
	echo Deployed cipresrest and restclient 
fi

$CATALINA_HOME/bin/startup.sh
