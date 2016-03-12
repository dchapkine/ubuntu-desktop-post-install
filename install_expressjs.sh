#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

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

# install expressjs
if hash express 2>/dev/null; then
	echo "  express already installed"
else
	echo "  express not installed, installing it now"

	npm install express-generator -g

fi
