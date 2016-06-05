#!/bin/bash

# tested on ubuntu 16.04 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# add nvidia ppa
sudo apt-get -y purge nvidia-*
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get -y update

# install nvidia drivers and nvidia prime
sudo apt-get -y install nvidia-367 nvidia-prime


echo "	you should reboot now"




