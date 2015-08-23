#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME



# tested: works on ubuntu 14.04.3 gnome
# https://www.spotify.com/fr/download/linux/

# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886 &>> $SCRIPT_LOGFILE

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list &>> $SCRIPT_LOGFILE

# 3. Update list of available packages
sudo apt-get -y update &>> $SCRIPT_LOGFILE

# 4. Install Spotify
sudo apt-get install -y spotify-client &>> $SCRIPT_LOGFILE
