#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


if hash platformio 2>/dev/null; then
	echo "  platformio already installed"
else
	echo "  platformio not installed, installing it now"


	sudo pip install -U pip setuptools
	sudo pip install -U platformio

fi



