There are several cron jobs that help the various versions of the portal run smoothly.  

From Geoff Avila, regarding cron jobs to remove old workspace directories.
------------------------------------------------------
Under portal2prod (or test)

in the /logs dir, remove anything with the pattern *.log.20* that's older than 3
0 days. Likewise, in the /logs/finished_logs dir, remove files that match that p
attern that are older than 30 days.

in sge_jobs and bwbatch_jobs, do the same for any files or directories that havn
't been touched in 30 days; recursively. Likewise, recursively remove anything m
ore than a day old under /tmp/treedraw.

The portal2test script is run by portal2test at midnight Sunday on 8ball. The 
po rtal2prod script is run at fifteen past midnight on snooker by the portal2prod 
u ser, and again five minutes later on snooker by the bwbatch user. Between those
three, they should scan every  file under the /archives/science/ngbt/portal* dirs. 
The two scripts themselves are in the portal2prod user's ~/scripts dir.
------------------------------------------------------
I checked those two scripts plus the others we use into sdk/scripts.

So what we've got running is:
-------------------------------------------------------------------------------------
portal2test@8ball		midnight Sun		portal2_test_exp.sh
						10pm Sun			update_crl.sh

portal2prod@snooker		12:15 Sun			portal2_prod_exp.sh

bwbatch@snooker			12:15 Sun			portal2_prod_exp.sh
						midnight, daily		kill_long_jobs.sh

portal2prod@qball		10pm, 1st of month	update_crl.sh
						10pm daily			tg_ws_cleanup.sh
						1am daily			restart_tomcat.sh	(too many open files issue)
-------------------------------------------------------------------------------------


