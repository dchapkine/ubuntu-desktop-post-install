#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 16.04 gnome

# add nvidia ppa
sudo apt-get -y purge nvidia-*
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get -y update

# install nvidia drivers and nvidia prime
sudo apt-get -y install nvidia-367 nvidia-prime


echo "	you should reboot now"




