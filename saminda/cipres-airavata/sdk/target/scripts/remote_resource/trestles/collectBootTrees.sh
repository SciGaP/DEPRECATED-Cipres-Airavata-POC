#!/bin/bash

NUM=`ls -l *.run00.boot.tre 2>/dev/null | wc -l`

if [ "$NUM" -eq 0 ]
then
# 	echo "Bootstrap treefiles not found"
	exit
elif [ "$NUM" -gt 1 ]
then
	echo "Bootstrap treefiles from multiple runs found"
	exit
fi

ofprefix=`ls *.run00.boot.tre`
ofprefix=${ofprefix%.run00.boot.tre}

#strip the bootstrap trees and end command out of the first boot treefile, 
#leaving up through the end of the translate block
grep -v "tree bootrep" $ofprefix.run00.boot.tre | grep -v "^end" > allBootTrees.tre

#grab the bootstrap trees from all files, doing it multiple times to keep the trees 
#in order despite my poor numbering scheme
#runs 0 -> 99
grep -h "tree bootrep" $ofprefix.run??.boot.tre >> allBootTrees.tre

#runs 100 -> 999
NUM=`ls -l $ofprefix.run???.boot.tre 2>/dev/null | wc -l`
if [ "$NUM" -gt 0 ]
then
	grep -h "tree bootrep" $ofprefix.run???.boot.tre | >> allBootTrees.tre
fi

#runs 1000 -> 9999
NUM=`ls -l $ofprefix.run????.boot.tre 2>/dev/null | wc -l`
if [ "$NUM" -gt 0 ]
then
	grep -h "tree bootrep" $ofprefix.run????.boot.tre >> allBootTrees.tre
fi

#runs 10000 -> 99999 - unlikely to ever have this many
NUM=`ls -l $ofprefix.run?????.boot.tre 2>/dev/null | wc -l`
if [ "$NUM" -gt 0 ]
then
	grep -h "tree bootrep" $ofprefix.run?????.boot.tre >> allBootTrees.tre
fi

echo "end;" >> allBootTrees.tre



