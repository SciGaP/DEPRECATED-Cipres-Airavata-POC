
$CATALINA_HOME/bin/shutdown.sh

mvn  clean install 
retval=$?
if [ $retval != 0 ]; then
	echo build failure;
	exit 1;
fi


rm -rf $CATALINA_HOME/webapps/restclient $CATALINA_HOME/webapps/restclient.war $CATALINA_HOME/work
cp target/restclient.war $CATALINA_HOME/webapps

$CATALINA_HOME/bin/startup.sh
