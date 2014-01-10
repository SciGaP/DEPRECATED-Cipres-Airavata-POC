#!/bin/sh
source $HOME/.bashrc
PATH=/usr/sbin:$PATH
TODAY=`date +%m-%d-%Y`
CIPRES_CHARGE=TG-DEB090011
IPLANT_CHARGE=TG-MCB110022

cd ~/tgusage
tgusage.sh

~/scripts/usage.py -c $CIPRES_CHARGE -a > cipres_tg_jobs.csv
~/scripts/usage.py -c $CIPRES_CHARGE -u > cipres_su_per_user_$TODAY.csv
~/scripts/usage.py -c $CIPRES_CHARGE -t > cipres_su_per_user_total.csv
~/scripts/usage.py -c $CIPRES_CHARGE -p > cipres_su_this_period.csv

~/scripts/usage.py -c $IPLANT_CHARGE -a > iplant_tg_jobs.csv
~/scripts/usage.py -c $IPLANT_CHARGE -u > iplant_su_per_user_$TODAY.csv
~/scripts/usage.py -c $IPLANT_CHARGE -t > iplant_su_per_user_total.csv
~/scripts/usage.py -c $IPLANT_CHARGE -p > iplant_su_this_period.csv

cd ~/scripts
~/scripts/usage.py -c $CIPRES_CHARGE -w 



