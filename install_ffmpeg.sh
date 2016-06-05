#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


sudo apt-get --purge remove ffmpeg &>> $SCRIPT_LOGFILE
sudo apt-get --purge autoremove &>> $SCRIPT_LOGFILE

sudo apt-get install ppa-purge &>> $SCRIPT_LOGFILE
sudo ppa-purge ppa:jon-severinsson/ffmpeg &>> $SCRIPT_LOGFILE

sudo add-apt-repository ppa:mc3man/trusty-media &>> $SCRIPT_LOGFILE
sudo apt-get update &>> $SCRIPT_LOGFILE
sudo apt-get dist-upgrade &>> $SCRIPT_LOGFILE

sudo apt-get install ffmpeg &>> $SCRIPT_LOGFILE

