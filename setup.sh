#!/bin/bash

repete="true"
while [ $repete == "true" ]; do
	clear
	echo "*************************************************************************************"
	echo "*************************AUTOMATIC CONFIGURATION TOOL********************************"
	echo "*************************************************************************************"
	echo "************ PLEASE TYPE THE NUMBER OF YOUR SYSTEM THEN PRESS ENTER *****************"
	echo "* 1 - Gateway 838GM                                                                 *"
	echo "* 9 - EXIT APPLICATION                                                              *"
	echo "*************************************************************************************"
	read userInput
	if [ "$userInput" == '1' ]; then

		clear
		echo "************** CREATING NEEDED DIRECTORIES ******************"
		#MAKE DIRECTORIES USED BY MY APPLICATIONS
		mkdir -p ~/Documents
		mkdir -p ~/Downloads
		mkdir -p ~/Mail
		mkdir -p ~/Pictures/screenshots
		mkdir -p ~/Torrents/session
		mkdir -p ~/session
		mkdir -p ~/Music
		mkdir -p ~/.config
		mkdir -p ~/.weechat
		echo "************** DIRECTORY CREATION COMPLETED *****************"

		echo "*************** INSTALLING NEEDED PACKAGES ******************"
		#INSTALL PACKAGES FROM MY PACKAGE.LIST FILE
		sudo pacman -S $(cat package.list) --needed --noconfirm
		echo "************ PACKAGE INSTALLATION COMPLETED *****************"

		 
		echo "************* APPLYING GATEWAY 838GM PATCHES ****************"
		#FIX AUDIO ISSUE FROM GATEWAY 838GM DESKTOP
		echo "password" | sudo -S -u root sh -c 'echo "options snd_hda_intel model=5stack" >> /etc/modprobe.d/snd-hda-intel.conf'

		#FIX TO STOP INTEL VIDEO CARD FROM SCREEN TEAR
		echo "password" | sudo -S -u root sh -c 'echo "Section \"Device\"" >> /etc/X11/xorg.conf.d/20-intel.conf'
		echo "password" | sudo -S -u root sh -c 'echo "   Identifier  \"Intel Graphics\"" >> /etc/X11/xorg.conf.d/20-intel.conf'
		echo "password" | sudo -S -u root sh -c 'echo "   Driver  \"intel\"" >> /etc/X11/xorg.conf.d/20-intel.conf'
		echo "password" | sudo -S -u root sh -c 'echo "   Option  \"TearFree\""    \"true"\"" >> /etc/X11/xorg.conf.d/20-intel.conf'
		echo "password" | sudo -S -u root sh -c 'echo "EndSection" >> /etc/X11/xorg.conf.d/20-intel.conf'
		echo "******************* PATCHES APPLIED**************************"

		echo "***************** COPY CONFIGURATION FILES ******************"
		#COPY ALL CONFIG FILES TO THEIR PROPER LOCATION
		cp -r .config/* ~/.config/
		cp -r .weechat/* ~/.weechat/
		cp .Xauthority ~/
		cp .Xdefaults ~/
		cp .Xresources ~/
		cp .bash_logout ~/
		cp .bash_profile ~/
		cp .bashrc ~/
		cp .conkyrc ~/
		cp .rtorrent.rc ~/
		cp .xinitrc ~/
		cp .xsession ~/
		sudo cp .dmenu_run /sbin/dmenu_run
		echo "************* CONFIGURATION FILES COPIED ********************"

		echo "************** SETTING CENTRAL TIME ZONE ********************"
		#SET TIMEZONE TO CENTRAL STANDARD TIME
		sudo timedatectl set-timezone America/Chicago
		echo "********************* TIME ZONE SET *************************"

		clear
		echo "*************** SETUP COMPLETED SUCESSFULLY *****************"
		$repete = "false"
		exit;
	elif [ "$userInput" == "9" ]; then
		clear
		echo "*************** USER TERMINATED APPLICATION *****************"
		$repete = "false"
		exit;
	else
		clear
		echo "********* APPLICATION TERMINATED -- INVALID OPTION **********"
		echo "*********** PRESS ENTER TO RELAUNCH APPLICATION *************"
		read
		$repete = "true"
	fi
done 
