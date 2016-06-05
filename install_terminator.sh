#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# checking terminator
if hash terminator 2>/dev/null; then
	echo "  checking terminator => ok"
else
	echo "  checking terminator => terminator not installed, installing it now"
	sudo add-apt-repository -y ppa:gnome-terminator/nightly &>> $SCRIPT_LOGFILE
	sudo apt-get -y update &>> $SCRIPT_LOGFILE
	sudo apt-get -y install terminator &>> $SCRIPT_LOGFILE
fi

