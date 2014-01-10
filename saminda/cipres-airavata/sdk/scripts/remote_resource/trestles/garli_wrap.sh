#!/bin/sh

# Can't run module command (I think it's a bash fn) without sourcing bashrc
source $HOME/.bashrc

module load garli
echo "CIPRES_THREADSPP=$CIPRES_THREADSPP"
echo "CIPRES_NP=$CIPRES_NP"
echo "running: mpirun -hostfile $PBS_NODEFILE -np $CIPRES_NP Garli $*"

mpirun -hostfile $PBS_NODEFILE -np $CIPRES_NP Garli $*

ls *.best.tre > /dev/null 2>&1
if [ ! $? ]; then
	echo "combining .best.tre files in all.tre"
	grep -h ^tree *.best.tre > all.tre
fi
echo running collectBootTrees
collectBootTrees.sh

