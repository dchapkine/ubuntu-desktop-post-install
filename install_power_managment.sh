#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

# https://help.ubuntu.com/community/PowerManagement/ReducedPower
# http://askubuntu.com/questions/285434/is-there-a-power-saving-application-similar-to-jupiter

sudo apt-get -y install powertop &>> $SCRIPT_LOGFILE
sudo apt-get -y install cpufrequtils &>> $SCRIPT_LOGFILE




