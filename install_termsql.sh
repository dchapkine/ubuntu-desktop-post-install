#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


# TODO: check if python, sqlite3 are installed

if hash termsql 2>/dev/null; then
	echo "  termsql server already installed"
else
	echo "  termsql server not installed"


	DIR=`mktemp -d`
	cd $DIR
	git clone git@github.com:andialbrecht/sqlparse.git .
	sudo python setup.py install
	rm -rf $DIR


	DIR=`mktemp -d`
	cd $DIR
	git clone git@github.com:tobimensch/termsql.git .
	sudo python setup.py install
	rm -rf $DIR

fi

