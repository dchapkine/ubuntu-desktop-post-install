#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME



# tested: works on ubuntu 14.04.3 gnome
sudo apt-get -y install vlc &>> $SCRIPT_LOGFILE

