
# LastLog4J - Demo VM for Log4Shell
This project is a semi-automated homelab for exploiting the Log4Shell (CVE-2021-44228) vulnerability in Minecraft. This CTF style lab has a flag called *~/secrets.txt*. The goal is to use the use the malicious LDAP server running on **172.30.1.5** to get Remote Code Execution within the game and read the contents of the file. 

## Background
Back in Dec 2021, when this exploit was taking off in the wild. I released a tutorial video on setting this up. Most of the manual steps in this video is covered with Vagrant shell provisioners. 
[![#logs4j Minecraft Homelab Tutorial](https://img.youtube.com/vi/JEO95aCnrmQ/0.jpg)](https://www.youtube.com/watch?v=JEO95aCnrmQ)

  
## Getting Started
1. Install [Virtualbox](https://www.virtualbox.org/) & [Vagrant](https://www.vagrantup.com/downloads)
2.  `vagrant plugin install vagrant-vbguest`
3. `vagrant up && vagrant reload`
4.  Get :coffee: and wait until provisioners are done, before interacting with the GUI

## Time to play 
5. Login to the VM using [vagrant default creds](https://stackoverflow.com/a/29450405)
6. Launch a terminal window and enter `minecraft-launcher`
7. Sign into a [Mojang/Microsoft account](https://www.minecraft.net/en-us/mojang-account-move) before playing
8.  Install 1.12.2 launcher
![ah](https://user-images.githubusercontent.com/11700790/178097587-12e07e10-5290-4e56-bbd9-8261f0eab68a.gif)
9. Select **Multiplayer** and direct connect to 
10. Run the exploit in the game

*Hint: This lab comes with the [feihong-cs/JNDIExploit](https://web.archive.org/web/20211213030144/https://github.com/feihong-cs/JNDIExploit) look at it to see how it's done. *

## View Running Services
After getting the flag, you can view the services under the hood via SSH. 
1.  `vagrant ssh`
6.  `sudo su -`
7.  `screen -ls` 
* Minecraft-Server is **game**; Malicious LDAP Server is **killbox**
4. Detach from screen **Ctrl-a Ctrl-d**

## Burn it down
Get rid of the VM when your done
`vagrant destroy -f`
