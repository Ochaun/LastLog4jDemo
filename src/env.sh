#!/bin/bash
export JAVA_HOME=/usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64/bin
export PATH=$JAVA_HOME:$PATH
export JAVA_HOME=/usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64/bin >> /etc/profile
export PATH=$JAVA_HOME:$PATH >> /etc/profile
source /etc/profile
gdebi -n Minecraft.deb
sudo deluser vagrant sudo