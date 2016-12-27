#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

if hash handbrake 2>/dev/null; then
	echo "  handbrake already installed"
else
	echo "  handbrake not installed, installing it now"

	sudo apt-get -y install handbrake handbrake-cli

fi

