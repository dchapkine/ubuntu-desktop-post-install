#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


# todo: find better check
if hash mysql 2>/dev/null; then
	echo "  mysql server already installed"
else
	echo "  mysql server not installed"

	pMySqlPass="root"

	echo "mysql-server mysql-server/root_password password $pMySqlPass" | sudo debconf-set-selections
	echo "mysql-server mysql-server/root_password_again password $pMySqlPass" | sudo debconf-set-selections
	sudo apt-get -y install mysql-server
	sudo apt-get -y install mysql-client
	sudo apt-get -y install mysql-common

fi

