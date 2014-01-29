#!/bin/sh
DASH_USER=terri
ACCOUNT=TG-DEB090011
BEGIN=`date +%m-%d-%Y --date='1 month ago'`
END=`date +%m-%d-%Y`

if [ "$1" != "" ];  then
	BEGIN=$1
fi
if [ "$2" != "" ];  then
	END=$2
fi

if [ "$3" != "" ]; then
	ACCOUNT="$3"
fi

echo "Importing tgusage data for $BEGIN to $END"



# ssh terri@dash-login.sdsc.edu "source /etc/bashrc; cd tgusage; ct-tgusage -j --username=cipres --account=$ACCOUNT --begindate=$BEGIN --enddate=$END > tgusage_report.txt"
# scp terri@dash-login.sdsc.edu:tgusage/tgusage_report.txt .

# This gets usage info for all accounts (cipres community account like always, but also individual allocations and iplant)
ssh cipres@trestles-login1.sdsc.edu \
	"source ~/.bashrc; cd tgusage; cipres-tgusage -j --username=cipres --begindate=$BEGIN --enddate=$END > tgusage_report.txt"
scp cipres@trestles-login1.sdsc.edu:tgusage/tgusage_report.txt .

# Need to use full path to file since importTgusage does a cd
importTgusage `pwd`/tgusage_report.txt > `pwd`/tgusage_log.txt 2>&1
