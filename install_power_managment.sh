#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# https://help.ubuntu.com/community/PowerManagement/ReducedPower
# http://askubuntu.com/questions/285434/is-there-a-power-saving-application-similar-to-jupiter


sudo apt-get -y install powertop &>> $SCRIPT_LOGFILE
sudo apt-get -y install cpufrequtils &>> $SCRIPT_LOGFILE
