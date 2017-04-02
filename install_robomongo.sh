#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME


# tested: works on ubuntu 14.04.3 gnome

#https://download.robomongo.org/1.0.0-rc1/linux/robomongo-1.0.0-rc1-linux-x86_64-496f5c2.tar.gz
#https://download.robomongo.org/0.9.0/linux/robomongo-0.9.0-linux-x86_64-0786489.tar.gz


URL='https://download.robomongo.org/1.0.0-rc1/linux/robomongo-1.0.0-rc1-linux-x86_64-496f5c2.tar.gz'
rm -rf ~/.robomongo_latest
mkdir -p ~/.robomongo_latest
cd ~/.robomongo_latest
wget $URL
tar xfz robomongo-1.0.0-rc1-linux-x86_64-496f5c2.tar.gz
mv ./robomongo-1.0.0-rc1-linux-x86_64-496f5c2/* .
rm -rf ./robomongo-1.0.0-rc1-linux-x86_64-496f5c2*
cd -


#
# add path
#
if grep -Fxq '# installed by ubuntu-desktop-post-install/install_robomongo.sh #' ~/.bashrc
then

    echo "  path already added"

else
    
    echo '' >> ~/.bashrc
    echo '#' >> ~/.bashrc
    echo '# robomongo' >> ~/.bashrc
    echo '#' >> ~/.bashrc
    echo '# installed by ubuntu-desktop-post-install/install_robomongo.sh #' >> ~/.bashrc
    echo '#' >> ~/.bashrc
    echo 'export PATH="$HOME/.robomongo_latest/bin:$PATH"' >> ~/.bashrc
    echo '' >> ~/.bashrc
    
fi


# old install doesnt work any more
#sudo apt-get install -y libxcb-render-util0 libxcb-xkb1 libxkbcommon-x11-0
#URL='http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.deb'
#FILE=`mktemp`
#wget "$URL" -qO $FILE
#sudo dpkg -i $FILE
#rm $FILE



