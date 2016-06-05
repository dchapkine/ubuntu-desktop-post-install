#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

# checking openshot
if hash openshot 2>/dev/null; then
	echo "  checking openshot => ok"
else
	echo "  checking openshot => openshot not installed, installing it now"
	sudo apt-get -y install openshot
	exit;
fi


