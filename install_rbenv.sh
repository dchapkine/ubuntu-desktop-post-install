#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
SCRIPT_ENVFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".env"

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome



if grep -Fxq '# installed by ubuntu-desktop-post-install/install_rbenv.sh #' ~/.bashrc
then
	
	echo "  rbenv already installed"

else

	# https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04

	echo "  installing dependencies"
	sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev >> $SCRIPT_LOGFILE


	echo "  cloning rbenv"
	cd
	rm -rf .rbenv
	git clone -q git://github.com/sstephenson/rbenv.git .rbenv
	git clone -q git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	echo "gem: --no-document" > ~/.gemrc

	echo '' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# rbenv' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo '# installed by ubuntu-desktop-post-install/install_rbenv.sh #' >> ~/.bashrc
	echo '#' >> ~/.bashrc
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc
	echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
	echo '' >> ~/.bashrc


	# update env file, so the parent shell can update its env too
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $SCRIPT_ENVFILE
	echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> $SCRIPT_ENVFILE
	



	echo "  !!! PLEASE LOGOUT AND LOGIN AGAIN AFTER INSTALLATION FINISHES"
	echo "  run 'rbenv install -v 2.2.2' to install ruby"
	echo "  run 'rbenv global 2.2.2' to set 2.2.2 as default global ruby version"

	#echo "  installing ruby 2.2.2 (will take few minutes)"
	#exec bash -c "rbenv install -v 2.2.2 &> /dev/null; rbenv global 2.2.2 &> /dev/null; rbenv rehash &> /dev/null"

	# @example: install ror and bundler
	# gem install bundler && rbenv rehash;
	# gem install rails && rbenv rehash;

	# @example: install new ruby version
	# rbenv install -v X.X.X

	# @example: create rails app
	# cd ~/Desktop
	# nvm use 0.12.7 # you have to specify what node version to use in current shell instance
	# rails new testapp
	# cd testapp
	# rake db:create
	# rails server

fi

