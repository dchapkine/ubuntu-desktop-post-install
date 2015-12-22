#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# https://www.getlektor.com/docs/installation/
# https://news.ycombinator.com/item?id=10771627

# checking lektor
if hash lektor 2>/dev/null; then
	echo "  checking lektor => ok"
else
	echo "  checking lektor => lektor not installed, installing it now"

	sudo apt-get -y install imagemagick &>> $SCRIPT_LOGFILE
	curl -sf https://www.getlektor.com/install.sh | sh

fi




