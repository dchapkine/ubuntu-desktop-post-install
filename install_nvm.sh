#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME




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
sudo apt-get -y install build-essential libssl-dev &>> $SCRIPT_LOGFILE
curl -sS https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh &>> $SCRIPT_LOGFILE
#source ~/.bashrc

echo "  run 'nvm install stable', (logout & relogin first)"

# exec bash -c "nvm ls-remote; nvm install stable"

#echo "TODO: PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"
#echo "After install, check available version by typing 'nvm ls-remote'"
#echo "Then install version(s) you need by running, for example: 'nvm install 0.12.7' or use 'nvm install stable' to install latest stable version"
#echo "Usually, nvm will switch to use the most recently installed version. You can explicitly tell nvm to use the version we just downloaded by typing: 'nvm use 0.12.7'"
#echo "If you have multiple Node.js versions, you can see what is installed by typing: 'nvm ls'"


