#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


#
# there is a bug affecting versions of 14.04 with mysql5.6+ installed:
# https://bugs.launchpad.net/ubuntu/+source/mysql-workbench/+bug/1287424
#
# so instead of using version available in ubuntu repos, well download it from oracle CDN
#
# OLD:   sudo apt-get -y install mysql-workbench
#

if hash mysql-workbench 2>/dev/null; then
	echo "  mysql-workbench already installed"
else

	echo "  mysql-workbench not installed => installing mysql-workbench"

	URL='http://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community-6.2.5-1ubu1404-amd64.deb'
	#URL='http://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community-6.3.6-1ubu1404-amd64.deb'
	FILE=`mktemp`
	wget "$URL" -qO $FILE
	sudo dpkg -i $FILE
	rm $FILE

fi







