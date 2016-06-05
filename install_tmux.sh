#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# checking tmux
if hash tmux 2>/dev/null; then
	echo "  checking tmux => ok"
else
	echo "  checking tmux => installing it now"
	
	sudo apt-get -y install tmux &>> $SCRIPT_LOGFILE
fi


