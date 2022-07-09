#!/bin/bash
echo '#!/bin/bash' > /etc/profile.d/java.sh
export JAVA_HOME=/usr/lib/java-1.8.0-openjdk-1.8.0.111-0.b15.el6_8.x86_64/bin
export PATH=$JAVA_HOME:$PATH
echo 'export JAVA_HOME=/usr/lib/java-1.8.0-openjdk-1.8.0.111-0.b15.el6_8.x86_64/bin' >> /etc/profile.d/java.sh
echo 'export PATH=$JAVA_HOME:$PATH' >> /etc/profile.d/java.sh
gdebi -n Minecraft.deb