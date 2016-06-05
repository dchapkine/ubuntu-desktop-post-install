#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


# checking pip
if hash pip 2>/dev/null; then
	echo "  checking pip => ok"
else
	echo "  checking pip => pip not installed, please install it and retry"
	exit;
fi


if hash aws 2>/dev/null; then
	echo "  aws already installed"
else

	echo "  aws not installed => installing aws"

	sudo pip install awscli &>> $SCRIPT_LOGFILE
	
fi






