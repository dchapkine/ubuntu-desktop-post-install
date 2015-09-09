#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME





# todo: find better check
if hash ubuntu-sdk 2>/dev/null; then
	echo "  ubuntu sdk already installed"
else
	echo "  ubuntu sdk not installed"

	sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
	sudo apt -y update && sudo apt -y install ubuntu-sdk
	sudo apt -y update && sudo apt -y dist-upgrade


fi




