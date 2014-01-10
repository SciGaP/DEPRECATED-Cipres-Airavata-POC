#!/bin/sh

garli-mpi $*
if [ "$MPIRUN_RANK" ==  "" ] || [ $MPIRUN_RANK -eq 0 ] ; then
	treefiles=`echo *.best.tre`
	if [ "$treefiles" != "*best.tre" ]; then
		grep -h ^tree *.best.tre > all.tre
	fi
	collectBootTrees.sh
fi

