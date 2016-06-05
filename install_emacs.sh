#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

sudo apt-get -y install emacs24-nox &>> $SCRIPT_LOGFILE