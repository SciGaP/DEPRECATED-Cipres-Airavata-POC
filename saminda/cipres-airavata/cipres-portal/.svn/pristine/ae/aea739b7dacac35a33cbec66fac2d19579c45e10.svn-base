Before an application can submit jobs to the rest service, we create an application record for it.
Each request (except those coming from a cipresadmin) must have the following headers:
	cipres-appkey
	cipres-eu
	cipes-eu-email
	cipres-eu-institution
We form the actual username by concatenating the application's name (found by looking up the cipres-appkey)
with a period and then the cipres-eu.

Application record has:
	`APP_ID` 
		autoinc primary key
	`APP_KEY`
		randomly generated string
	`NAME`  aka appname
		short name, consiting of only alphanumerics, so spaces, and underscore. 
		Absolutely can't contain a "."
	`LONGNAME` 
		Descriptive name for the application.

	`AUTH_TYPE` = UMBRELLA or DIRECT 
	`AUTH_USER_ID` 
		Only used for UMBRELLA.  Refers to the account who's username and password will be used. 

	# PRIMARY CONTACT INFO FOR APPLICATION DEVELOPER OR ADMIN
	`FIRST_NAME` varchar(100) NOT NULL,
	`LAST_NAME` varchar(100) NOT NULL,
	`INSTITUTION` varchar(255) DEFAULT NULL,
	`STREET_ADDRESS` varchar(255) DEFAULT NULL,
	`CITY` varchar(100) DEFAULT NULL,
	`STATE` varchar(50) DEFAULT NULL,
	`COUNTRY` varchar(50) DEFAULT NULL,
	`MAILCODE` varchar(10) DEFAULT NULL,
	`ZIP_CODE` varchar(10) DEFAULT NULL,
	`AREA_CODE` varchar(10) DEFAULT NULL,
	`PHONE_NUMBER` varchar(20) DEFAULT NULL,
	`EMAIL` varchar(200) NOT NULL,
	`WEBSITE_URL` varchar(255) DEFAULT NULL,
	`COMMENT` varchar(255) DEFAULT NULL,

	`ACTIVE` 
		Used to disable requests by this application

	PRIMARY KEY (`APP_ID`),
	UNIQUE KEY `NAME` (`NAME`)
	UNIQUE KEY `APP_KEY` (`NAME`)

The reason for having both app_key and app_id is that we give the app_key to the devloper to put
in his requests and if someone else starts using it, we can simply change the app_key and give the
new one to the developer. It would be a little more difficult if we needed to create a new 
application record with new app_id, since I plan to store statistics and so forth with the 
app_id.

For umbrella application accounts, we 

	1) validate username and password in request headers against our user db and also make
	sure that the user we find matches the application's auth_usr_id.

	2) look up appname.cipres-euser, and if it doesn't exit we add a new user record.  Note
	that email address doesn't need to be unique across all users, just all users associated
	this application.  So a user can use multiple apps with the same email address.  Once 
	we've got our end user record, that's our effective user and *that's the username we require in 
	the urls.*

For direct application accounts, each user of the application must create a cipres user record
for himself.  we'll require that the username have the form appname.username. 

User records created for the REST service, both those for umbrella account auth_users and direct
account end users will be limited to alphanumerics and a few punctation marks,but not colon
and periods.  Colons make basich auth parsing impossible.  Accounts that are created on the fly when
an unknown cipres-eu header is sent by an umbrella application, can have virtually any ascii characters.

We will have to reject usernames that have single quotes since that would make escaping them to
pass to shell commands like deleteUser.py to difficult.
