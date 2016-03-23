#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


if hash lt 2>/dev/null; then
	echo "  lt already installed"
else
	echo "  lt not installed, installing it now"

	npm install -g localtunnel

fi
