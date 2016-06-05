#!/bin/bash

# tested on ubuntu 16.04 (gnome)
# tested on ubuntu 14.04.3 (gnome)

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


if grep -Fxq '# installed by ubuntu-desktop-post-install/install_nvm.sh #' ~/.bashrc
then
	
	echo "  nvm already installed"

else


	# install stable ubuntu packages
	# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server
	#sudo apt-get -y install nodejs
	#sudo apt-get -y install npm


	# install more uptodate packages
	# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server
	#curl -sL https://deb.nodesource.com/setup | sudo bash -
	#sudo apt-get update
	#sudo apt-get install nodejs
	#sudo apt-get install build-essential


	# install using node version manager
	# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server


	echo '' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# nvm' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# installed by ubuntu-desktop-post-install/install_nvm.sh #' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '' >> ~/.bashrc

	sudo apt-get -y install build-essential libssl-dev curl &>> $SCRIPT_LOGFILE
	curl -sS https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | sh &>> $SCRIPT_LOGFILE
	#source ~/.bashrc

	# set 4.4 as default version
	echo 'nvm alias default 4.4 &>> /dev/null' >> ~/.bashrc


	echo "  run 'nvm install stable', (logout & relogin first)"

	# exec bash -c "nvm ls-remote; nvm install stable"

	#echo "TODO: PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"
	#echo "After install, check available version by typing 'nvm ls-remote'"
	#echo "Then install version(s) you need by running, for example: 'nvm install 0.12.7' or use 'nvm install stable' to install latest stable version"
	#echo "Usually, nvm will switch to use the most recently installed version. You can explicitly tell nvm to use the version we just downloaded by typing: 'nvm use 0.12.7'"
	#echo "If you have multiple Node.js versions, you can see what is installed by typing: 'nvm ls'"

	#echo "set default version using nvm alias default 0.12.7"

fi

