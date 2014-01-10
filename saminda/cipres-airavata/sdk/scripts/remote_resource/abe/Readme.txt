Info about running on abe
See specific <tool.txt> files for decisions we made about how to run 
specific tools on abe. 

================================================================================
MPI on abe:

The way we're running mpi jobs is confusing.  Cipres's ~/.soft specifes openmpi.
I did this because Waynne originally had trouble getting mvapich2 to work:

	"The reason that we used Open MPI for RAxML is that early on I couldn't 
	get MVAPICH2 to work because I didn't know about the command:
   	export MVA2_ENABLE_AFFINITY=0".

You can tell we're using openmpi by running "which mpicc" and "which mpirun".
However, gram generates a job script that starts the mvapich2 daemon and then
calls mpirun.  I guess the daemon just isn't used, but if you look at the job
script you would assume we're using mvapich2, which we aren't.



================================================================================

RSL on abe:
================================================================================
From: marcusiu@ncsa.uiuc.edu [marcusiu@ncsa.uiuc.edu] On Behalf Of
 marcusiu@ncsa.illinois.edu [marcusiu@ncsa.illinois.edu]
 Sent: Wednesday, January 13, 2010 2:12 PM
 To: Wayne Pfeiffer; Terri Schwartz
 Cc: Nancy Wilkins-Diehr; Von Welch; jquinn
 Subject: Re: Globus support at NCSA

 ok, here's the final word. This has been tested and is in production
 on NCSA Abe system.


 To specify number of nodes and ppn using Globus RSL

 SYNTAX: (host_count=value)
         (xcount=value)

 e.g. (host_count=2)            #defines the value of host_count RSL
 parameter (nodes parameter for PBS) to be 2
      (xcount=4)                #defines the value of xcount RSL
 parameter (ppn parameter for PBS) to be 4

 FYI, more documentation about running MPI on abe at
 http://www.ncsa.illinois.edu/UserInfo/Resources/Hardware/Intel64TeslaCluster/Doc/Jobs.html


I asked for further clarification and Doru (author of the above email) responded that 
the above applies to the pre-ws gram script on abe.  Also that "ppn" isn't exactly
"processors per node" but is used to specify the number of mpi processes that will 
be started.  And if I set xcount=4 and host_count=1, 4 mpi processes will be started on an
8 core node, and if each mpi process has two threads, I'll be using all 8 cores.  Also, "count"
parameter shouldn't be used for mpi jobs on abe. 


