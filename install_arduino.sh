#!/bin/bash

SCRIPT_NAME=$(basename $BASH_SOURCE)
SCRIPT_LOGFILE="./logs/"$(basename -s .sh $BASH_SOURCE)".log"

echo "running "$SCRIPT_NAME

# tested: works on ubuntu 14.04.3 gnome


if hash arduino 2>/dev/null; then
	echo "  arduino already installed"
else
	echo "  arduino not installed, installing it now"

	sudo apt-get -y install arduino arduino-core

	# https://mightyohm.com/blog/2010/03/run-avrdude-without-root-privs-in-ubuntu/
	__tmp__arduino__cmd='SUBSYSTEM=="usb", SYSFS{idVendor}=="1781", SYSFS{idProduct}=="0c9f", GROUP="adm", MODE="0666"' && sudo sh -c "echo $__tmp__arduino__cmd > /lib/udev/rules.d/10-usbtinyisp.rules"
	#sudo restart udev
	sudo udevadm trigger

fi

SUBSYSTEM=="usb", ATTR{pro duct}=="USBtiny", ATTR{idPro duct}=="0c9f", ATTRS{idVendo r}=="1781", MODE="0660", GROUP="dialout"