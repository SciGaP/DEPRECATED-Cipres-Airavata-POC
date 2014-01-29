I keep database connection info for use with "mysql" and related commands in files like:

-rwx------ 1 terri cipres   67 Nov  7 16:21 /users/u4/terri/.mycipresprod.cnf

in my home directory, so that my password won't be on the command line and therefore visible to anyone
running ps.  It also won't be in our svn repo.  The format of these files is:

[mysql]
user=database_username
password=database_password
host=database_server_hostname
port=database_server_port


Some of these scripts are copied from documents/SWAMI_Design.


How to convert db to new schema:

1) Shutdown cipres and daemons and disable cron jobs so nothing is using the db.

2) Dump a backup of the data.

3) run the convert?.sql scrips in order.  

	- if all goes well, none output anything, except for convert.2.sql.

	- The purpose of convert2.sql is to look for duplicate jobhandles in tables where we're going
	to make jobhandle the primary key.  If dups are found, manually get rid of them (however seems best)
	before going on to convert3.sql.  
	
	- Convert4.sql converts the tables to innodb and takes the longest.

	- Make sure old tables got dropped.

	- Run createaccounts.sql to create admin account needed by rest service.  It also
	creates some test accounts used by the rest test applications.



