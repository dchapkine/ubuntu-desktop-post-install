#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"
mkdir -p ./logs && chmod 755 ./logs

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome

# guide to follow for 14.04: https://www.leaseweb.com/labs/2013/08/wildcard-dns-ubuntu-hosts-file-using-dnsmasq/
# .dev => https://iyware.com/dont-use-dev-for-development/

if hash dnsmasq 2>/dev/null; then
	echo "  dnsmasq already installed"
else
	echo "  dnsmasq not installed, installing it now"


	sudo apt-get -y install dnsmasq
	echo "!!!!!!!!!! IMPORTANT: follow this steps on ubuntu 14.04 !!!!!!!!!!!!!!!!!!!!"
	echo ""
	echo "  first of all, avoid using .local domains with wildcard subdomains, it doesn't work"
	echo "  appearantly, there is a conflict with 'avahi-daemon'...which might be fixable, but we wont bother trying"
	echo "  we'll simply use a .dev domain here"
	echo "  ...well no we won't. recently, google became the owner of .dev TLD, so your local DNS might override one of the future .dev domains"
	echo "  if you don't care, just use .dev...if you do, please pick something else...that is not a valid TLD"
	echo ""
	echo "  in this guide, we will use .localhost and .loc"
	echo ""
	echo "	1/ now edit this file: sudo emacs '/etc/dnsmasq.conf' and add 'address=/.loc/127.0.0.1' as well as 'address=/localhost/127.0.0.1' lines"
	echo "  2/ then comment 'dns=dnsmasq' line in /etc/NetworkManager/NetworkManager.conf"
	echo "  3/ find list of dnsmasq services running: 'sudo netstat -plant | grep :53' and kill em all using sudo 'kill -9 ID_PROCESS'"
	echo "  4/ restart the service: 'sudo service dnsmasq restart'"
	echo "  5/ add 'prepend domain-name-servers 127.0.0.1;' line to '/etc/dhcp/dhclient.conf' file"
	echo "  6/ restart network manager: 'sudo service network-manager restart' "
	echo ""
	echo "  Now you can enjoy your wildcard local subdomains"
	echo "  The good thing is that we will never need to add subdomains one by one, it will jusy work for any *.*.localhost and *.*.loc out of the box"

fi

