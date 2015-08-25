#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME


sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make &>> $SCRIPT_LOGFILE 
sudo apt-get -y update &>> $SCRIPT_LOGFILE 
sudo apt-get -y install ubuntu-make &>> $SCRIPT_LOGFILE 

if [ ! -d /home/$USER/tools/android/android-ndk ] ; then
	yes 'a' | umake android android-ndk /home/$USER/tools/android/android-ndk
	echo 'export PATH="$HOME/tools/android/android-ndk:$PATH"' >> ~/.bashrc
else
	echo "  Android NDK already installed"
fi

if [ ! -d /home/$USER/tools/android/android-studio ] ; then
	yes 'a' | umake android android-studio /home/$USER/tools/android/android-studio
	echo 'export PATH="$HOME/Android/Sdk/platform-tools:$PATH"' >> ~/.bashrc
else
	echo "  Android SDK already installed"
	echo "  Android Studio already installed"
	echo "  !!! Please logout/relogin to be able to use Android SDK tools"
fi

