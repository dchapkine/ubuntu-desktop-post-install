#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# checking nodejs
if hash node 2>/dev/null; then
	echo "  checking node => ok"
else
	echo "  checking node => node not installed, please install it and retry"
	exit;
fi

# checking npm
if hash npm 2>/dev/null; then
	echo "  checking npm => ok"
else
	echo "  checking npm => npm not installed, please install it and retry"
	exit;
fi


if hash nexe 2>/dev/null; then
	echo "  nexe already installed"
else

	npm install nexe -g

fi









