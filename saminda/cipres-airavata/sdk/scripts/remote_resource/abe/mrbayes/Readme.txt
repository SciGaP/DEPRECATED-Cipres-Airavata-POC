Terri - Thu Feb 11 10:49:51 CST 2010
	Built Hybrid MrBayes according to instructions from Wayne.  See HybridMrBayes.txt.

Terri - Sat Jan  9 08:32:51 CST 2010
	I originally built mrbayes according to these instructions in
	mrbayes_3.1.2p but accidentally used the wrong makefile and built
	a serial version.  mrbayes_3.1.2p_new was built correctly.

=============================================================================

The patched version of MrBayes is at

   /home/teragrid/tg459107/mrbayes-3.1.2p  on Lonestar and

   /u/ncsa/pfeiffer/mrbayes-3.1.2p  on Abe.

Starting from MrBayes 3.1.2, I added three of the four patches from

http://www.bestgrid.org/index.php/Bioinformatics_applications_at_University_of_Canterbury_HPC#Installing_MrBayes
.

Namely, I added Patches 1, 2, and 4.  Patch 3 changes a default
parameter, which is not convenient for our users.

Compilation
-----------

To compile on either machine,  just do the following:

   cp Makefile_mpip Makefile
   make

The executable will be compiled with the Intel compiler and will be
called mb.  I moved the executable to mb_mpip, but you can leave it
as mb if you like.


MPI variations:
------------------------------
According to Yan:
With your default .soft setting, you are using mvapich2-1.2-intel-ofed-1.2.5.5 and intel c/c++
10.1. If your code doesn't use mpich2 features (e.g., one-sided comm), you can change .soft
to use mpich by adding the following lines to .soft: +mpichvmi-intel

According to Wayne, to compile for openmpi run: 
	soft add +openmpi-1.3.2-intel
and then recompile.  
