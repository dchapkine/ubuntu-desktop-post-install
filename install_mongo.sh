#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


# todo: find better check
if hash mongo 2>/dev/null; then
	echo "  mongo package already installed"
else
	echo "  mongo package not installed"


	# https://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

	echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

	sudo apt-get -y update

	sudo apt-get -y install mongodb-org

	sudo service mongod restart


	###########################################################################
	# Warning solution "WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'"
	#
	# To remove warning, add this after "chown $DAEMONUSER /var/run/mongodb.pid" line in "/etc/init/mongod.conf" file:

	
	#if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
	#	echo never > /sys/kernel/mm/transparent_hugepage/enabled
	#fi
	#
	#if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
	#	echo never > /sys/kernel/mm/transparent_hugepage/defrag
	#fi
	

	###########################################################################
	# Links:
	#
	# http://askubuntu.com/questions/597372/how-do-i-modify-sys-kernel-mm-transparent-hugepage-enabled
	# http://stackoverflow.com/questions/28911634/how-to-avoid-transparent-hugepage-defrag-warning-from-mongodb
	# http://docs.mongodb.org/manual/tutorial/transparent-huge-pages/




fi



