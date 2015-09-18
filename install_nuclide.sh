#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# checking nodejs
if hash apm 2>/dev/null; then
	echo "  checking apm => ok"
else
	echo "  checking apm => apm not installed, please install atom and retry"
	exit;
fi

apm --no-confirm install nuclide-installer


