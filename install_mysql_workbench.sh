#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


sudo apt-get -y install mysql-workbench


# @todo fix that
# there is a bug affecting versions of 14.04 with mysql5.6+ installed:
# https://bugs.launchpad.net/ubuntu/+source/mysql-workbench/+bug/1287424
