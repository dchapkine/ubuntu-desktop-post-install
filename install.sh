#!/bin/bash

DISTRIBUTOR=$(lsb_release -i | awk -F"\t" '{print $2}')

if [ "$DISTRIBUTOR" = "Ubuntu" ]; then

	. /etc/lsb-release
	echo $DISTRIB_DESCRIPTION

	if [ "$DISTRIB_RELEASE" = "14.04" ]; then

		chmod +x *.sh

		mkdir -p ./logs
		chmod 755 ./logs
		rm -rf ./logs/*

		./preinstall.sh
		./install_git_core.sh
		./install_git_gui.sh
		./install_emacs.sh
		./install_spotify.sh
		./install_vlc.sh
		#./install_steam.sh
		./install_sublimetext3.sh
		./install_icons.sh
		./install_docker.sh
		./install_nvm.sh
		./install_rbenv.sh
		./install_virtualbox.sh
		./install_ffmpeg.sh
		./install_filezilla.sh
		./install_android.sh
		./install_power_managment.sh
		./install_git_bash_prompt.sh


	else
		
		echo ""
		echo "Sorry, this script only works with Ubuntu 14.04 for the moment. You are running $DISTRIB_RELEASE"
		echo ""

	fi

else
	echo ""
	echo "Sorry, this script only works with Ubuntu. You are running $DISTRIBUTOR"
	echo ""
fi
