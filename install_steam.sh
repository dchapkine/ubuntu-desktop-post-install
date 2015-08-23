#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME



# tested: works on ubuntu 14.04.3 gnome
# http://doc.ubuntu-fr.org/steam


# todo: check if we need this
# http://askubuntu.com/questions/588024/steam-install-error-on-14-04-ubuntu-64bit
# sudo apt-get install libc6:i386 libgl1-mesa-dri-lts-vivid:i386 libgl1-mesa-glx-lts-vivid:i386


sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B05498B7
echo "deb http://repo.steampowered.com/steam/ precise steam" | sudo tee -a  /etc/apt/sources.list.d/steam.list
sudo apt-get -y update >> $SCRIPT_LOGFILE
sudo apt-get -y install steam-launcher >> $SCRIPT_LOGFILE
