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
  config.vm.box = "ubuntu/bionic64"
  config.vm.provider :virtualbox
  config.vm.network "private_network", ip: "172.30.1.5"
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = true
  end


  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
     vb.customize ['modifyvm', :id, '--clipboard-mode', 'bidirectional']
  
     # Customize the amount of memory on the VM:
     vb.memory = "6144"
   end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "dwn", type: "shell", path: './src/dwn.sh'    

  # Creating the flag for the lab
  config.vm.provision "io", type: "shell", inline: <<-SHELL
    uuidgen > secret.txt
    chmod 700 secret.txt
    mkdir exploit
  SHELL

  config.vm.provision "curl", type: "shell", path: './src/curl.sh'
  config.vm.provision "env", type: "shell", path: './src/env.sh'
  config.vm.provision "serve", type: "shell", run: "always", path: './src/serve.sh'
end