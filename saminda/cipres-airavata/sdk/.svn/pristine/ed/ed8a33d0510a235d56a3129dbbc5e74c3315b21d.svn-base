/*
	Add some accounts that the rest api test applications use by default.

	Password in these test users is md5 hash of "test" as computed by
	cipres.  Cipres does something weird so you can't figure out the the hash with: echo test | openssl md5.
	You need to let the java code do it, then find the value in the db and paste it in here.
	Password for admin user is a secret.
*/


# Create an admin account.  Need one for job callbacks.   
insert into users (default_group_id, email, first_name, last_name, password, role, username, active) values
    (1, 'ciprestester3@gmail.com', 'cipresadmin', 'cipresadmin', '01394aa2cb426e28273ef54a9e814817', 'ADMIN', 'cipresadmin', 1);


/*
	TODO: we don't know the user id to put into the application as auth_user_id.
# Creates an application that uses an umbrella account and creates the umbrella user record (userid = 2)
insert into applications (name, longname, auth_type, auth_user_id, email, first_name, last_name, active) values
    ('guitest', 'Cipres Struts Test Client', 'UMBRELLA', 2, 'ciprestester3@gmail.com', 'guiapp', 'adminstrator', 1);

insert into users (default_group_id, email, first_name, last_name, password, role, username, appname, active) values
    (1, 'ciprestester2@gmail.com', 'test2', 'test2', '098f6bcd4621d373cade4e832627b4f6', 'REST_UMBRELLA', 'guitest_admin',
    'guitest', 1);
*/


# Creates an application that uses direct end user login and 2 users that can be used with it.
insert into applications (name, longname, auth_type, email, first_name, last_name, active) values
    ('scripts', 'Cipres Python Test Clients', 'DIRECT', 'ciprestester3@gmail.com', 'scripts', 'adminstrator', 1);

insert into users (default_group_id, email, first_name, last_name, password, role, username, appname, active) values
    (1, 'ciprestester1@gmail.com', 'test1', 'test1', '098f6bcd4621d373cade4e832627b4f6', 'REST_END_USER',
    'scripts.test1', 'scripts', 1);

insert into users (default_group_id, email, first_name, last_name, password, role, username, appname, active) values
    (1, 'ciprestester2@gmail.com', 'test2', 'test2', '098f6bcd4621d373cade4e832627b4f6', 'REST_END_USER', 'scripts.test2',
    'scripts', 1);


