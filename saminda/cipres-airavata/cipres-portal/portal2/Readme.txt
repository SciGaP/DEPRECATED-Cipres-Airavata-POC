How to temporarily disable job submission:
=======================================================================================
Edit taskList.jsp and taskSummary.jsp

In taskList.jsp comment out the "Run Task" button (the whole <s:if> block) and add 
	<span class="prompt">ALERT: Job submission will be disabled until Nov 12.</span>
directly above the line:
	<!-- Field Headers -->

In taskSummary.jsp comment out the "Save and Run Task" button and add 
	<span class="prompt">ALERT: Job submission will be disabled until Nov 12.</span><p>
directly below:
	<div class="tabbedBox">

If you're brave you can make these changes under $CATALINA_HOME and they'll show up 
immediately.  You should still stop and restart tomcat so that users are forced to
log in and are less likely to see a cached version of the old pages.


Building and deploying a debug version of cipres portal with maven
=======================================================================================

If you can build on macosx or linux and deploy on the same machine where you
build, the easiest way to go is :

	1.  create a directory where you'll keep copies of the jar that's used by the
	process workers.  For example, "mkdir ~/sdk_versions".

	2. In your login script set the env var SDK_VERSIONS to the directory you just
	created.  Add SDK_VERSIONS to your path.

	3.  copy cipres-portal/scripts/tl.sh to this directory (cipres-portal) 

	4.  edit sdk/properties/cipres-dev.properties:
		* make sure process_worker_logs is set to a reasonable directory for log files.  
		* "workspace" is the directory bwbatch uses.  Login to 8ball as bwbatch,
		create your own workspace directory, then set the workspace property to
		your directory.
		* If you want to run sge jobs and you're deploying to an sge submission 
		host, also change workspace.cluster, the directory that's used to run 
		sge jobs.  See comment in cipres-dev.properties for details.

	5. run "sh tl.sh".  This should:
		* Stop the local tomcat server
		* Build the sdk and copy a version of it, plus the script process_worker_run
		to $SDK_VERSIONS
		* Build portal2.war and copy it to $CATALINA_HOME/webapps
		* Restart the tomcat server

If you're building on windows and/or deploying to a machine other than the one you built
on, the tl.sh script won't work.  You could modify it OR you can just do this:

	- on the Unix machine where you'll deploy, do this one time set-up: 
		1. If you run tomcat under your own user account:
			* create a directory called "~/sdk_versions"
			* put sdk_versions directory in the path 
		If tomcat is run by a different user (special web account managed by
		IT for example) you'll have to create an sdk_versions directory that
		has read and execute permissions for that user (and rwx for you) and put
		the directory in the web user's path.  You'll probably need IT to modify 
		the path for you.


	- On your build machine:
		2. Modify cipres-dev.properties as in step 4 above.
		3. Build the sdk:
			cd sdk; mvn -Denv=cipres-dev install
		4. Build cipres-portal:
			cd cipres-portal; mvn -Devn=cipres-dev install
		5. copy sdk/target/scripts/process_worker_run to the sdk_versions directory
		on the deployment machine.
		6. copy sdk/target/sdk-2.0-jar-with-dependencies.jar to the sdk_versions 
		directory on the deployment machine.
		7. Make process_worker_run executable (on the deployment machine):
			chmod +x sdk_versions/process_worker_run
		8. Deploy the portal2.war web application as usual.	



For SDSC users only: You can't run sge/cluster jobs unless the web server that 
you deploy to is an sge submission host for the cluster - in particular, you won't 
be able to run sge jobs from your laptop.  You can however run jobs such as 
paup, RID3Paup and RID3raxml, because they aren't run via sge.

