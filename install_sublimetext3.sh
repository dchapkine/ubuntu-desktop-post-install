#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME



# tested: works on ubuntu 14.04.3 gnome
# http://askubuntu.com/questions/172698/how-do-i-install-sublime-text-2-3


sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 &>> $SCRIPT_LOGFILE
sudo apt-get -y update &>> $SCRIPT_LOGFILE
sudo apt-get -y install sublime-text-installer &>> $SCRIPT_LOGFILE
