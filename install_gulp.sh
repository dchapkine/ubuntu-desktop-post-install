#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


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

# checking gulp
if hash gulp 2>/dev/null; then
	echo "  gulp already installed"
else
	echo "  gulp not installed, installing it now"

	npm install --global gulp-cli

fi
