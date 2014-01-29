I just switched over from struts 2.0.9 to 2.1.1, mostly because I think there have been fixes to the ognl library after the 2.6.11 version we were using, that may solve a deadlock situation we seem to encounter.

The changes are limited to sdk/pom.xml, cipres-portal/pom.xml and cipres-portal/src/main/resources/struts.xml.

I also needed to 
	1. cd ~/.m2
	2. mv repository SAVE_repository
	3. mkdir repository; cp -r SAVE_repository/pal repository

to start fresh.  Otherwise the old version of ognl sticks around and is used.
Globus libraries are in our local repository, referenced in sdk/pom.xml (not sure why we never put pal there).

