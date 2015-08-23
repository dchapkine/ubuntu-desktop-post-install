#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME



# tested: works on ubuntu 14.04.3 gnome
# http://doc.ubuntu-fr.org/virtualbox

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -  &>> $SCRIPT_LOGFILE
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list &>> $SCRIPT_LOGFILE
sudo apt-get update &>> $SCRIPT_LOGFILE
sudo apt-get -y install virtualbox-5.0 &>> $SCRIPT_LOGFILE
sudo usermod -G vboxusers -a $USER &>> $SCRIPT_LOGFILE

