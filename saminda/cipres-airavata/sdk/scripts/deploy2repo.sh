# This is the script I used to add the globus and saml jars to our repo.  I wrote the deploy fn after
# I had already deployed the globus jars; otherwise I would have used it for them too.

deploy()
{
	mvn -e deploy:deploy-file \
		-DgroupId=org.globus \
		-DartifactId=$1\
		-Dversion=gt4 \
		-Dpackaging=jar \
		-Dfile=./$2\
	-DrepositoryId=maven-repository-production \
	-Durl="scp://maven@8ball.sdsc.edu:/users/u4/maven/maven-repository/maven2"
}

##########################################################################################################
# These are from the gridshib distribution, /projects/cipres/terri/teragrid/SAVE_gridshib-saml-tools-0_5_0.
##########################################################################################################
deploy commons-codec-1.3 commons-codec-1.3.jar
deploy cog-jglobus cog-jglobus.jar
deploy xalan xalan.jar
deploy xmlsec-1.2.1 xmlsec-1.2.1.jar
deploy globus-opensaml-1.1 globus-opensaml-1.1.jar
deploy gridshib-common-0_5_0 gridshib-common-0_5_0.jar
deploy gridshib-saml-tools-0_5_0 gridshib-saml-tools-0_5_0.jar


##########################################################################################################
# I took these jars from the simplegrid2/java/lib directory and put them in mvn repo and my pom.xml
# I think globus modified some of the third party jars so I'm calling the version "gt4".
##########################################################################################################

mvn -e deploy:deploy-file \
	-DgroupId=org.globus \
	-DartifactId=cog-jglobus\
	-Dversion=gt4 \
	-Dpackaging=jar \
	-Dfile=./cog-jglobus.jar \
-DrepositoryId=maven-repository-production \
-Durl="scp://maven@8ball.sdsc.edu:/users/u4/maven/maven-repository/maven2"


mvn -e deploy:deploy-file \
	-DgroupId=org.globus \
	-DartifactId=puretls \
	-Dversion=gt4 \
	-Dpackaging=jar \
	-Dfile=./puretls.jar \
-DrepositoryId=maven-repository-production \
-Durl="scp://maven@8ball.sdsc.edu:/users/u4/maven/maven-repository/maven2"

mvn -e deploy:deploy-file \
	-DgroupId=org.globus \
	-DartifactId=jce-jdk13-125 \
	-Dversion=gt4 \
	-Dpackaging=jar \
	-Dfile=./jce-jdk13-125.jar \
-DrepositoryId=maven-repository-production \
-Durl="scp://maven@8ball.sdsc.edu:/users/u4/maven/maven-repository/maven2"

mvn -e deploy:deploy-file \
	-DgroupId=org.globus \
	-DartifactId=cryptix32 \
	-Dversion=gt4 \
	-Dpackaging=jar \
	-Dfile=./cryptix32.jar \
-DrepositoryId=maven-repository-production \
-Durl="scp://maven@8ball.sdsc.edu:/users/u4/maven/maven-repository/maven2"

mvn -e deploy:deploy-file \
	-DgroupId=org.globus \
	-DartifactId=cryptix-asn1 \
	-Dversion=gt4 \
	-Dpackaging=jar \
	-Dfile=./cryptix-asn1.jar \
-DrepositoryId=maven-repository-production \
-Durl="scp://maven@8ball.sdsc.edu:/users/u4/maven/maven-repository/maven2"

