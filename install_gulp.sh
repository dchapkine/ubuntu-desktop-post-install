#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


if hash gulp 2>/dev/null; then
	echo "  gulp already installed"
else
	echo "  gulp not installed, installing it now"

	npm install --global gulp-cli

fi
