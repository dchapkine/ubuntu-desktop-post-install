#!/bin/bash

sudo mkdir -p /tmp/kernel_4_4_11
cd /tmp/kernel_4_4_11

wget \
kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.11-xenial/linux-headers-4.4.11-040411_4.4.11-040411.201605182255_all.deb \
kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.11-xenial/linux-headers-4.4.11-040411-generic_4.4.11-040411.201605182255_amd64.deb \
kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.11-xenial/linux-image-4.4.11-040411-generic_4.4.11-040411.201605182255_amd64.deb

sudo dpkg -i linux-headers-4.4.11*.deb linux-image-4.4.11*.deb

## sudo apt-get remove linux-headers-4.4.11* linux-image-4.4.11*


