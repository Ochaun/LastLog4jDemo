#!/bin/bash
echo 'Download minecraft and exploit'
# Java & Minecraft 
curl -s -L https://launcher.mojang.com/v1/objects/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar -o server.jar
curl -s -L https://launcher.mojang.com/v1/objects/0f275bc1547d01fa5f56ba34bdc87d981ee12daf/client.jar -o client.jar
curl -s -L https://github.com/ojdkbuild/ojdkbuild/releases/download/1.8.0.111-1/java-1.8.0-openjdk-1.8.0.111-0.b15.el6_8.x86_64.zip -o java-1.8.0-openjdk-1.8.0.111-0.b15.el6_8.x86_64.zip
# sketchy exploit kit I found on Wayback machine
curl -s "http://web.archive.org/web/20211211031401/https://objects.githubusercontent.com/github-production-release-asset-2e65be/314785055/a6f05000-9563-11eb-9a61-aa85eca37c76?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211211%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211211T031401Z&X-Amz-Expires=300&X-Amz-Signature=140e57e1827c6f42275aa5cb706fdff6dc6a02f69ef41e73769ea749db582ce0&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=314785055&response-content-disposition=attachment%3B%20filename%3DJNDIExploit.v1.2.zip&response-content-type=application%2Foctet-stream" -o ./exploit/JNDIExploit.v1.2.zip
wget -q https://launcher.mojang.com/download/Minecraft.deb
unzip -qq -o ./exploit/JNDIExploit.v1.2.zip -d ./exploit/
unzip -qq -o java-1.8.0-openjdk-1.8.0.111-0.b15.el6_8.x86_64.zip
mv -f java-1.8.0-openjdk-1.8.0.111-0.b15.el6_8.x86_64/ /usr/lib/