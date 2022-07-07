#!/usr/bin/bash

echo "Vagrant Provisioning for Ubuntu"

export DEBIAN_FRONTEND='noninteractive'
apt-get update

apt install 


echo "Download Minecraft installer"
curl -v -s -q -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar > server.jar

