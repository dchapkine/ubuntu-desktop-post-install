#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome
# tested: works on ubuntu 16.04   gnome


# check laravel dependency
composer global require laravel/installer

# install spark
rm -rf ~/.laravel_spark
mkdir -p ~/.laravel_spark
cd ~/.laravel_spark
git clone https://github.com/laravel/spark-installer.git .
composer install

#
# add path
#
if grep -Fxq '# installed by ubuntu-desktop-post-install/install_laravel_spark.sh #' ~/.bashrc
then

    echo "  path already added"

else
    
    echo '' >> ~/.bashrc
    echo '#' >> ~/.bashrc
    echo '# laravel spark' >> ~/.bashrc
    echo '#' >> ~/.bashrc
    echo '# installed by ubuntu-desktop-post-install/install_laravel_spark.sh #' >> ~/.bashrc
    echo '#' >> ~/.bashrc
    echo 'export PATH="$HOME/.laravel_spark:$PATH"' >> ~/.bashrc
    echo '' >> ~/.bashrc

    echo ""
    echo "Don't forget to run 'source ~/.bashrc' to refresh your shell PATH variable"
    echo ""
    
fi

