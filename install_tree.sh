#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# todo: find better check
if hash tree 2>/dev/null; then
	echo "  tree server already installed"
else
	echo "  tree server not installed"

	sudo apt-get -y install tree &>> $SCRIPT_LOGFILE
fi

