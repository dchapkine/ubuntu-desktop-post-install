#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

# this installs docker and makes it runnable without sudo
# because of that you will need to logout/login or reboot your machine after install

#https://docs.docker.com/installation/ubuntulinux/

myusername=$(whoami)

sudo apt-get -y install curl &>> $SCRIPT_LOGFILE 
curl -sSL https://get.docker.com/ | sh &>> $SCRIPT_LOGFILE
sudo usermod -aG docker $myusername &>> $SCRIPT_LOGFILE


sudo service docker start &>> $SCRIPT_LOGFILE



#echo "TODO: PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"
#echo "after install, check that your you belong to docker group by typing: 'id'"
#echo "then check if docker is installed correctly and doesnt require sudo, by running this command: 'docker run hello-world'"

