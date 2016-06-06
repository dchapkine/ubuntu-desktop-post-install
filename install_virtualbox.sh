#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME



. /etc/lsb-release
echo $DISTRIB_DESCRIPTION


# ubuntu 14.04.3 gnome
# http://doc.ubuntu-fr.org/virtualbox
if [ "$DISTRIB_RELEASE" = "14.04" ]; then

	echo "running UBUNTU 14.04 version"
	
	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -  &>> $SCRIPT_LOGFILE
	echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list &>> $SCRIPT_LOGFILE
	sudo apt-get update &>> $SCRIPT_LOGFILE
	sudo apt-get -y install virtualbox-5.0 &>> $SCRIPT_LOGFILE
	sudo usermod -G vboxusers -a $USER &>> $SCRIPT_LOGFILE

# ubuntu 16.04 gnome
elif [ "$DISTRIB_RELEASE" = "16.04" ]; then

	echo "running UBUNTU 16.04 version"

	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -  &>> $SCRIPT_LOGFILE
	echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list &>> $SCRIPT_LOGFILE
	sudo apt-get update &>> $SCRIPT_LOGFILE
	sudo apt-get -y install virtualbox-5.0 &>> $SCRIPT_LOGFILE
	sudo usermod -G vboxusers -a $USER &>> $SCRIPT_LOGFILE
	

else
	echo "no compatible installer found for your distribution"
fi



