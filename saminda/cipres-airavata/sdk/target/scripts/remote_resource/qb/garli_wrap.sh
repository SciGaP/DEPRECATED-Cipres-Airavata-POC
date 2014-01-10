#!/bin/sh

RANK="$OMPI_COMM_WORLD_RANK"
garli-mpi $*
if [ "$RANK" ==  "" ] || [ $RANK -eq 0 ] ; then
    treefiles=`echo *.best.tre`
    if [ "$treefiles" != "*best.tre" ]; then
        grep -h ^tree *.best.tre > all.tre
    fi
    echo running collectBootTrees
    collectBootTrees.sh
fi


