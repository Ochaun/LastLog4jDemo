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

  #Put the repo in the box
  config.vm.synced_folder "./src/", "/srv/minecraft"

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

  
     # Customize the amount of memory on the VM:
     vb.memory = "1024"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELL
    apt install unzip -y
    curl -s -L https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar -o /srv/minecraft/server.jar
    curl -s -L https://github.com/ojdkbuild/ojdkbuild/releases/download/1.8.0.121-1/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64.zip -o /usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64.zip
    unzip -o /usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64.zip && rm /usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64.zip
    export JAVA_HOME=/usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64/bin
    export PATH=$JAVA_HOME:$PATH
    export JAVA_HOME=/usr/lib/java-1.8.0-openjdk-1.8.0.121-0.b13.el6_8.x86_64/bin >> /etc/profile
    export PATH=$JAVA_HOME:$PATH >> /etc/profile
    source ~/.bashrc
    java -Xms1G -Xmx1G -jar ./server.jar --nogui
   SHELL
end
