#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"
mkdir -p ./logs && chmod 755 ./logs


echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome
# tested: works on ubuntu 16.04   gnome


. /etc/lsb-release
echo $DISTRIB_DESCRIPTION

if [ "$DISTRIB_RELEASE" = "14.04" ]; then

    echo "running UBUNTU 14.04 version"
    
    if hash insync 2>/dev/null; then
	echo "  checking insync => ok"
    else
	echo "  checking insync => insync not installed, installing it "
	wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
	echo "deb http://apt.insynchq.com/ubuntu trusty non-free contrib" | sudo tee -a  /etc/apt/sources.list.d/insync.list &>> $SCRIPT_LOGFILE
	sudo apt-get -y update &>> $SCRIPT_LOGFILE
	sudo apt-get -y install insync &>> $SCRIPT_LOGFILE
    fi

elif [ "$DISTRIB_RELEASE" = "16.04" ]; then

    echo "running UBUNTU 16.04 version"
    
    
    if hash insync 2>/dev/null; then
	echo "  checking insync => ok"
    else
	echo "  checking insync => insync not installed, installing it "
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
	echo "deb http://apt.insynchq.com/ubuntu xenial non-free contrib" | sudo tee -a  /etc/apt/sources.list.d/insync.list &>> $SCRIPT_LOGFILE
	sudo apt-get -y update &>> $SCRIPT_LOGFILE
	sudo apt-get -y install insync &>> $SCRIPT_LOGFILE
    fi

    
else
    echo "no compatible installer found for your distribution"
fi

