#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


if hash arp-scan 2>/dev/null; then
	echo "  arp-scan already installed"
else
	echo "  arp-scan not installed, installing it now"

	sudo apt-get -y install arp-scan

fi


