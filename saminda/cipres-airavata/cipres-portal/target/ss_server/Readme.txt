We aren't using the socket server currently.  We would need the socket server
if the ProcessWorkers were logging to a DailyRollingLogFileAppender, because
there is a log4j bug such that when multiple processes write to such an
appender a lot of messages are lost around the time that the log file rolls.  

What we're doing instead is having the ProcessWorkers log to stdout and
redirecting that to a file, one per process, via a script that we use to
launch the ProcessWorkers.

What I was doing with the socket server, was building the portal (resource 
filtering is needed on the files in this directory) then copying target/ss_server to some
well known location, say ~ss_server, from which I would run ss_control to start and stop 
the server.  I'll commit a copy of the script I used to build and deploy cipres-portal (it's tl2.sh).

The other thing that needs to change to use the socket server is in profile.xml you have to
add properties to specify what port to use, and whether you're using the socket appender or the 
regular rolling file appender (I used the regular rolling one for debug builds).
