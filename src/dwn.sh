#!/bin/bash
echo 'installing deps'
apt-get -qq update -y
apt-get -qq upgrade -y
apt-get -qq -o=Dpkg::Use-Pty=0 --no-install-recommends install ubuntu-desktop -y
apt-get -qq -o=Dpkg::Use-Pty=0 --no-install-recommends install unzip gdebi-core libsecret-1-0 -y
apt-get -qq -o=Dpkg::Use-Pty=0 --no-install-recommends install virtualbox-guest-utils virtualbox-guest-x11 -y 
#dpkg-reconfigure gdm