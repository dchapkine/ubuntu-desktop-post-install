#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 16.04.4 gnome

# checking helm
if hash helm 2>/dev/null; then
	echo "  checking helm => ok"
else
	echo "  checking helm => helm not installed, installing it now"
	curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
	exit;
fi
helm version


