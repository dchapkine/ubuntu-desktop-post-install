#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# checking pip
if hash pip 2>/dev/null; then
	echo "  checking pip => ok"
else
	echo "  checking pip => pip not installed, installing it"
	exit;
fi

# checking pip3
if hash pip3 2>/dev/null; then
	echo "  checking pip3 => ok"
else
	echo "  checking pip3 => pip3 not installed, installing it"
	exit;
fi


