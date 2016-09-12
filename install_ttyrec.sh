#!/bin/bash

# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

if hash ttyrec 2>/dev/null; then
	echo "  ttyrec already installed"
else
	echo "  ttyrec not installed"

	sudo apt-get -y install ttyrec

	echo "	This is full solution to record and replay tty sessions"
	echo '	record with "ttyrec"'
	echo '	type "exit" to stop recording'
	echo '	"ttyplay ttyrecoed" to replay recording'

fi
