#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME



# https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04


sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev >> $SCRIPT_LOGFILE

cd
rm -rf .rbenv
git clone git://github.com/sstephenson/rbenv.git .rbenv >> $SCRIPT_LOGFILE
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
#source ~/.bashrc

echo "gem: --no-document" > ~/.gemrc


exec bash -c "rbenv install -v 2.2.2; rbenv global 2.2.2; gem install bundler; gem install rails; rbenv rehash"


# @example: install new ruby version
# rbenv install -v X.X.X

# @example: create rails app
# cd ~/Desktop
# nvm use 0.12.7 # you have to specify what node version to use in current shell instance
# rails new testapp
# cd testapp
# rake db:create
# rails server

