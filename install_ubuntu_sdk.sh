#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME



sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
sudo apt -y update && sudo apt -y install ubuntu-sdk
sudo apt -y update && sudo apt -y dist-upgrade


