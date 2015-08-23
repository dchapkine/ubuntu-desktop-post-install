#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME



# tested: works on ubuntu 14.04.3 gnome

sudo apt-get -y install git

# creating directory for all git projects
mkdir -p ~/git

# generate keys
machine_name=$(uname -n)


if [ -f ~/.ssh/git_id ];
then
	echo "git_id already exist"
	chmod 600 ~/.ssh/git_id
else
	echo "generating new git_id rsa key"
	echo -e  'y\n'| ssh-keygen -q -t rsa -C admin@localhost -f ~/.ssh/git_id -N ''
	chmod 600 ~/.ssh/git_id
fi

echo ""
echo "----------------------------------------------------------------------"
echo ""
cat ~/.ssh/git_id.pub
echo ""
echo "----------------------------------------------------------------------"


# create ssh config for git

if [ -f ~/.ssh/config ];
then
	echo "ssh config file already exist, i won't modify it"
else
	echo "creating ssh config for github and bitbucket services"

	echo "" > ~/.ssh/config

	echo "Host github" >> ~/.ssh/config
	echo "  HostName github.com" >> ~/.ssh/config
	echo "  IdentityFile ~/.ssh/git_id" >> ~/.ssh/config
	echo "  PreferredAuthentications publickey" >> ~/.ssh/config
	echo "" >> ~/.ssh/config

	echo "Host bitbucket" >> ~/.ssh/config
	echo "  HostName bitbucket.org" >> ~/.ssh/config
	echo "  IdentityFile ~/.ssh/git_id" >> ~/.ssh/config
	echo "  PreferredAuthentications publickey" >> ~/.ssh/config
	echo "" >> ~/.ssh/config

	git config --global user.name "admin"
	git config --global user.email "admin@localhost"
fi


