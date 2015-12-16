#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# checking screen
if hash screen 2>/dev/null; then
	echo "  checking screen => ok"
else
	echo "  checking screen => installing it now"
	
	sudo apt-get -y install screen &>> $SCRIPT_LOGFILE
fi


