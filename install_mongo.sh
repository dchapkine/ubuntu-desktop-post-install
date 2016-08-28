#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME





DISTRIBUTOR=$(lsb_release -i | awk -F"\t" '{print $2}')

if [ "$DISTRIBUTOR" = "Ubuntu" ]; then

	. /etc/lsb-release
	echo $DISTRIB_DESCRIPTION

	if [ "$DISTRIB_RELEASE" = "14.04" ]; then

		#
		# tested: works on ubuntu 14.04.3 gnome
		#
		if hash mongo 2>/dev/null; then
			echo "  mongo package already installed"
		else
			echo "  mongo package not installed"

			# https://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

			sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

			echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

			sudo apt-get -y update

			sudo apt-get -y install mongodb-org

			sudo service mongod restart


			###########################################################################
			# Warning solution "WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'"
			#
			# To remove warning, add this after "chown $DAEMONUSER /var/run/mongodb.pid" line in "/etc/init/mongod.conf" file:

			
			#if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
			#	echo never > /sys/kernel/mm/transparent_hugepage/enabled
			#fi
			#
			#if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
			#	echo never > /sys/kernel/mm/transparent_hugepage/defrag
			#fi
			

			###########################################################################
			# Links:
			#
			# http://askubuntu.com/questions/597372/how-do-i-modify-sys-kernel-mm-transparent-hugepage-enabled
			# http://stackoverflow.com/questions/28911634/how-to-avoid-transparent-hugepage-defrag-warning-from-mongodb
			# http://docs.mongodb.org/manual/tutorial/transparent-huge-pages/
		fi

	elif [ "$DISTRIB_RELEASE" = "16.04" ]; then

		if hash mongo 2>/dev/null; then
			echo "  mongo package already installed"
		else
			echo "  mongo package not installed"

			# https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04

			# install package
			sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
			echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
			sudo apt-get update
			sudo apt-get install -y mongodb-org

			# create service file
			sudo touch /etc/systemd/system/mongodb.service
			echo '[Unit]' | sudo tee -a /etc/systemd/system/mongodb.service
			echo 'Description=High-performance, schema-free document-oriented database' | sudo tee -a /etc/systemd/system/mongodb.service
			echo 'After=network.target' | sudo tee -a /etc/systemd/system/mongodb.service
			echo '' | sudo tee -a /etc/systemd/system/mongodb.service
			echo '[Service]' | sudo tee -a /etc/systemd/system/mongodb.service
			echo 'User=mongodb' | sudo tee -a /etc/systemd/system/mongodb.service
			echo 'ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf' | sudo tee -a /etc/systemd/system/mongodb.service
			echo '' | sudo tee -a /etc/systemd/system/mongodb.service
			echo '[Install]' | sudo tee -a /etc/systemd/system/mongodb.service
			echo 'WantedBy=multi-user.target' | sudo tee -a /etc/systemd/system/mongodb.service

			# start the service
			sudo systemctl start mongodb

			# start whe computer starts
			sudo systemctl enable mongodb


			###########################################################################
			# Warning solution "WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'"
			#
			# To remove warning, add this after "chown $DAEMONUSER /var/run/mongodb.pid" line in "/etc/init/mongod.conf" file:

			
			#if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
			#	echo never | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
			#fi
			#
			#if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
			#	echo never | sudo tee /sys/kernel/mm/transparent_hugepage/defrag
			#fi
			

			###########################################################################
			# Links:
			#
			# http://askubuntu.com/questions/597372/how-do-i-modify-sys-kernel-mm-transparent-hugepage-enabled
			# http://stackoverflow.com/questions/28911634/how-to-avoid-transparent-hugepage-defrag-warning-from-mongodb
			# http://docs.mongodb.org/manual/tutorial/transparent-huge-pages/
		fi

	else
		
		echo ""
		echo "Sorry, your ubuntu version is not supported. You are running $DISTRIB_RELEASE"
		echo ""

	fi

else
	echo ""
	echo "Sorry, this script only works with Ubuntu. You are running $DISTRIBUTOR"
	echo ""
fi





