#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

export XINIT_CONFIG=~/.xinitrc-xmonad

type blackbox_decrypt_all_files >/dev/null 2>&1 || \
{ echo >&2 "BlackBox is required.  Aborting."; exit 1; }

echo "Decrypting all BlackBox files..."

blackbox_decrypt_all_files

echo "Building OS Configuration..."

provisioning_file () {
  if [[ $# -lt 5 ]]; then
    echo "Usage: $0 <local_file> <destination_path> <permission> <owner> <group>"
    exit 1
  fi
  echo "provisioning file: $1, to: $2, mode: $3, owner: $4"
  if  [ -f $2 ]; then
    sudo rm -rf $2
  fi
  #create the containing directory if it doesn't exist.
  if [ ! -d `dirname $2` ]; then 
    mkdir -p `dirname $2`
  fi 
  cp `pwd`/$1 $2
  chown $4 $2
  chgrp $5 $2
  chmod $3 $2
}

if [[ `uname -a`  =~ ARCH || `uname -a` =~ Darwin ]]; then
    echo "Doing Arch / OS X Neutral Configurations..."
    provisioning_file aws.config ~/.aws/config 400 `whoami` `id -gn`
    provisioning_file aws.credentials ~/.aws/credentials 600 `whoami` `id -gn`
    provisioning_file id_rsa.pub ~/.ssh/id_rsa.pub 400 `whoami` `id -gn`
    provisioning_file id_rsa ~/.ssh/id_rsa 400 `whoami` `id -gn`
    provisioning_file zshrc ~/.zshrc 700 `whoami` `id -gn`

    if [ -e ~/.aliases ]; then
        rm -rf ~/.aliases
    fi
    cp `pwd`/aliases ~/.aliases
    #source ~/.aliases

    if [ -e ~/.functions ]; then
        rm -rf ~/.functions
    fi
    cp `pwd`/functions ~/.functions
    
    if [ -e ~/.functions-private ]; then
        rm -rf ~/.functions-private
    fi
    cp `pwd`/functions-private ~/.functions-private

    if [ -e ~/.offlineimaprc ]; then
        rm -rf ~/.offlineimaprc
    fi 
    cp `pwd`/offlineimaprc ~/.offlineimaprc

    if [ -e ~/.screenrc ]; then
    rm -rf ~/.screenrc
    fi 
    cp `pwd`/screenrc ~/.screenrc
    
    if [ -e ~/.mscreenrc ]; then
    rm -rf ~/.mscreenrc
    fi 
    cp `pwd`/mscreenrc ~/.mscreenrc

    if [ -e ~/.vimrc ]; then
        rm -rf ~/.vimrc
    fi 
    cp `pwd`/vimrc ~/.vimrc

    if [ -e `pwd`/aliases-private ]; then
        if [ -e ~/.aliases-private ]; then
            rm -rf ~/.aliases-private
        fi
    fi
    cp `pwd`/aliases-private ~/.aliases-private
    #source ~/.aliases-private
    
    if [ -e `pwd`/efnet.ircrc ]; then
        if [ -e ~/.efnet.ircrc ]; then
            rm -rf ~/.efnet.ircrc
        fi
    fi
    cp `pwd`/efnet.ircrc ~/.efnet.ircrc
    
    if [ -e `pwd`/freenode.ircrc ]; then
        if [ -e ~/.freenode.ircrc ]; then
            rm -rf ~/.freenode.ircrc
        fi
    fi
    cp `pwd`/freenode.ircrc ~/.freenode.ircrc
    
    cp `pwd`/global.ircrc ~/.global.ircrc
    if [ -e `pwd`/global.ircrc ]; then
        if [ -e ~/.global.ircrc ]; then
            rm -rf ~/.global.ircrc
        fi
    fi
    cp `pwd`/global.ircrc ~/.global.ircrc
   
    if [ -e `pwd`/mailcap ]; then
        if [ -e ~/.mailcap ]; then
            rm -rf ~/.mailcap
        fi
    fi
    cp `pwd`/mailcap ~/.mailcap
    
    if [ -e `pwd`/muttrc ]; then
        if [ -e ~/.muttrc ]; then
            rm -rf ~/.muttrc
        fi
    fi
    cp `pwd`/muttrc ~/.muttrc
    
    if [ -e `pwd`/npmrc ]; then
        if [ -e ~/.npmrc ]; then
            rm -rf ~/.npmrc
        fi
    fi
    cp `pwd`/npmrc ~/.npmrc
    chmod 600 ~/.npmrc

    if [ -e `pwd`/pinerc ]; then
        if [ -e ~/.pinerc ]; then
            sudo rm -rf ~/.pinerc
        fi
    fi
    sudo cp `pwd`/pinerc ~/.pinerc

    if [ -e `pwd`/gemrc ]; then
        if [ -e ~/.gemrc ]; then
            sudo rm -rf ~/.gemrc
        fi
    fi
    cp `pwd`/gemrc ~/.gemrc
    
    if [ -e `pwd`/bash_logout ]; then
        if [ -e ~/.bash_logout ]; then
            sudo rm -rf ~/.bash_logout
        fi
    fi
    cp `pwd`/bash_logout ~/.bash_logout
    chmod 700 ~/.bash_logout

    #empty out the profile
    if [ -e `pwd`/profile ]; then
        if [ -e ~/.profile ]; then
            sudo rm -rf ~/.profile
        fi
    fi
    cp `pwd`/profile ~/.profile
    chmod 700 ~/.profile
    
    if [ -e ~/.bash_profile ]; then
        rm -rf ~/.bash_profile
    fi
    cp `pwd`/bash_profile ~/.bash_profile

    if [ -e `pwd`/my.cnf ]; then
        if [ -e ~/.my.cnf ]; then
            sudo rm -rf ~/.my.cnf
        fi
    fi
    cp `pwd`/my.cnf ~/.my.cnf
    chmod 600 ~/.my.cnf
    
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    if [ -e ~/.ssh/config ]; then
        rm -rf ~/.ssh/config
    fi
    cp `pwd`/ssh_config ~/.ssh/config
   
    sudo mkdir -p /etc/salt
    #if [ -e /etc/salt-master ]; then
    #  sudo rm -rf /etc/salt/master
    #fi
    #sudo cp `pwd`/salt-master /etc/salt/master
    #sudo chmod 444 /etc/salt/master

    mkdir -p /etc/salt
    if [ -e /etc/salt-roster ]; then
      sudo rm -rf /etc/salt/roster
    fi
    sudo cp `pwd`/salt-roster /etc/salt/roster
    sudo chmod 444 /etc/salt/roster

    #for salt call
    mkdir -p /etc/salt
    if [ -e /etc/salt-minion ]; then
      sudo rm -rf /etc/salt/minion
    fi
    sudo cp `pwd`/salt-minion /etc/salt/minion
    sudo chmod 444 /etc/salt/minion

    #for salt-ssh (master and minon should be same).
    mkdir -p /etc/salt
    if [ -e /etc/salt-minion ]; then
      sudo rm -rf /etc/salt/master
    fi
    sudo cp `pwd`/salt-minion /etc/salt/master
    sudo chmod 444 /etc/salt/master

    #Make sure git is configured (for Github).
    git config --global user.name "Dan Sullivan"
    git config --global user.email "dansullivan@gmail.com"
    git config --global pull.rebase true
fi

if [[ `uname -a`  =~ ARCH ]]; then
    echo "Doing Arch Only Configuration..."

    if [ -e ~/.mcabberrc ]; then
        rm -rf ~/.mcabberrc
    fi
    cp `pwd`/mcabberrc ~/.mcabberrc
    
    
    if [ -e /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf ]; then
        sudo rm -rf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf
    fi
    sudo cp `pwd`/90-graphics-hypervisor.conf \
        /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf 

    mkdir -p ~/.xmonad
    if [ -e ~/.xmonad/xmonad.hs ]; then
        rm -rf ~/.xmonad/xmonad.hs 
    fi
    cp `pwd`/xmonad.hs  ~/.xmonad/xmonad.hs 

    if [ -e `pwd`/xmobarrc ]; then
        if [ -e ~/.xmobarrc ]; then
            rm -rf ~/.xmobarrc
        fi
    fi
    cp `pwd`/xmobarrc ~/.xmobarrc
   
    #if [ -e ~/.Xdefaults ]; then
    #    rm -rf ~/.Xdefaults
    #fi
    #cp `pwd`/Xdefaults ~/.Xdefaults

    if [ -e ~/.Xresources ]; then
        rm -rf ~/.Xresources
    fi
    cp `pwd`/Xresources ~/.Xresources

    if [ -e ~/.xinitrc-xmonad ]; then
        rm -rf ~/.xinitrc-xmonad
    else
        :
    fi
    cp `pwd`/xinitrc-xmonad ~/.xinitrc-xmonad
    
    if [ -e ~/.xinitrc ] ; then
        rm -rf ~/.xinitrc
    fi
    ln -s $XINIT_CONFIG ~/.xinitrc

    sudo mkdir -p /var/log/syslog-ng
    sudo chown root:log /var/log/syslog-ng
    sudo chmod 750 /var/log/syslog-ng 
    if [ -e /etc/syslog-ng/syslog-ng.conf ]; then
        sudo rm -rf /etc/syslog-ng/syslog-ng.conf
    fi
    sudo cp `pwd`/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf
    sudo systemctl enable syslog-ng
    sudo systemctl restart syslog-ng

    if [ -e /etc/syslog-ng/syslog-ng-private.conf ]; then
        sudo rm -rf /etc/syslog-ng/syslog-ng-private.conf
    fi
    sudo cp `pwd`/syslog-ng.conf /etc/syslog-ng/syslog-ng-private.conf
    #sudo /etc/rc.d/syslog-ng restart

    if [ -e /etc/iptables/iptables.rules ]; then
        sudo rm -rf /etc/iptables/iptables.rules
    fi
    sudo cp `pwd`/iptables.rules /etc/iptables/iptables.rules
    
    if [ -e /etc/iptables/iptables.rules-private ]; then
        sudo rm -rf /etc/iptables/iptables.rules-private
    fi
    sudo cp `pwd`/iptables.rules-private /etc/iptables/iptables.rules-private

    if [ -e /usr/lib/systemd/system/iptables.service ]; then
        sudo rm -rf /usr/lib/systemd/system/iptables.service 
    fi
    sudo cp `pwd`/iptables.service /usr/lib/systemd/system/iptables.service
    sudo chmod 644 /usr/lib/systemd/system/iptables.service
    #reload the config
    sudo systemctl --system daemon-reload
    sudo systemctl reload iptables
    sudo systemctl enable iptables
    sudo systemctl restart iptables
    #sudo /etc/rc.d/iptables restart

    if [ -e `pwd`/hosts ]; then
        if [ -e /etc/hosts ]; then
            sudo rm -rf /etc/hosts 
        fi
    fi
    sudo cp `pwd`/hosts /etc/hosts
    sudo chmod 444 /etc/hosts
    
    if [ -e `pwd`/nsswitch.conf ]; then
        if [ -e /etc/nsswitch.conf ]; then
            sudo rm -rf /etc/nsswitch.conf
        fi
    fi 
    sudo cp `pwd`/nsswitch.conf /etc/nsswitch.conf
    sudo chmod 644 /etc/nsswitch.conf 
    
    if [ -e `pwd`/smb.conf-private ]; then
        if [ -e /etc/samba/smb.conf ]; then
            sudo rm -rf /etc/samba/smb.conf
        fi
    fi
    sudo cp `pwd`/smb.conf-private /etc/samba/smb.conf
    sudo chmod 644 /etc/samba/smb.conf
    
    if [ -e `pwd`/samba ]; then
        if [ -e /etc/conf.d/samba ]; then
            sudo rm -rf /etc/conf.d/samba
        fi
    fi 
    sudo cp `pwd`/samba /etc/conf.d/samba
    sudo chmod 644 /etc/conf.d/samba 
    #sudo /etc/rc.d/samba restart
    #sudo systemctl reload samba
    echo "Working on Arch Only Configuration..."

    #if [ -e 'pwd'/network.service ]; then
    #    if [ -e /etc/systemd/system/network.service ]; then
    #        sudo rm -rf /etc/systemd/system/network.service
    #    fi
    #fi
    #sudo cp `pwd`/network.service /etc/systemd/system/network.service
    #sudo chmod 644 /etc/systemd/system/network.service
    
    if [ -e `pwd`/network@eno1 ]; then
        if [ -e /etc/conf.d/network@eno1 ]; then
            sudo rm -rf /etc/conf.d/network@eno1
        fi
    fi
    sudo cp `pwd`/network@eno1 /etc/conf.d/network@eno1

    if [ -e `pwd`/network@.service ]; then
        if [ -e /etc/systemd/system/network@.service ]; then
            sudo rm -rf /etc/systemd/system/network@.service
            :
        fi
    fi
    sudo cp `pwd`/network@.service /etc/systemd/system/network@.service
    #reload systemd, scan for new or changed units.
    sudo systemctl daemon-reload
    sudo systemctl enable network@eno1.service
    sudo systemctl stop network@eno1.service
    sudo systemctl start network@eno1.service
    
    #sudo systemctl stop offlineimap@.service
    if [ -e `pwd`/offlineimap@.service ]; then
        if [ -e /etc/systemd/system/offlineimap@.service ]; then
            sudo rm -rf /etc/systemd/system/offlineimap@.service 
        fi
    fi
    #sudo cp `pwd`/offlineimap@.service /etc/systemd/system/offlineimap@.service
    #sudo systemctl enable offlineimap@.service
    #sudo systemctl start offlineimap@.service 

    #virtualbox kernel modules
    if [ -e `pwd`/virtualbox.conf ]; then
        if [ -e /etc/modules-load.d/virtualbox.conf ]; then
            sudo rm -rf /etc/modules-load.d/virtualbox.conf
        fi
    fi
    sudo cp `pwd`/virtualbox.conf /etc/modules-load.d/virtualbox.conf
    
    if [ -e `pwd`/truecrypt.conf ]; then
        if [ -e /etc/modules-load.d/truecrypt.conf ]; then
            sudo rm -rf /etc/modules-load.d/truecrypt.conf
        fi
    fi
    sudo cp `pwd`/truecrypt.conf /etc/modules-load.d/truecrypt.conf

    #This should always be last in the ordering for Arch.
    if [ -e ~/.bashrc ]; then
        rm -rf ~/.bashrc
    fi
    cp `pwd`/bashrc ~/.bashrc
    #source ~/.bashrc


    #sshd
    if [ -e /etc/ssh/sshd_config ]; then
        sudo rm -rf /etc/ssh/sshd_config 
    fi
    sudo cp `pwd`/sshd_config-private /etc/ssh/sshd_config
    sudo systemctl enable sshd
    sudo systemctl restart sshd
    
    if [ -d ~/.config/xfce4/terminal ]; then
        mkdir -p ~/.config/xfce4/terminal
    fi 
    if [ -e ~/.config/xfce4/terminal/terminalrc ]; then
        rm -rf ~/.config/xfce4/terminal/terminalrc
    fi
    cp `pwd`/xfce4-terminalrc ~/.config/xfce4/terminal/terminalrc

    if [ -e  /etc/cron.daily/updaterepodatabases ]; then
        sudo rm -rf /etc/cron.daily/updaterepodatabases
    fi
    sudo cp `pwd`/updaterepodatabases /etc/cron.daily/updaterepodatabases
    sudo chmod 744 /etc/cron.daily/updaterepodatabases
    #make sure cronie is enabled and running, had a problem with this 12/6/2013
    sudo systemctl enable cronie
    sudo systemctl restart cronie
    
    if [ -e `pwd`/named.conf ]; then
        if [ -e /etc/named.conf ]; then
            sudo rm -rf /etc/named.conf
        fi
    fi
    sudo cp `pwd`/named.conf /etc/named.conf
    sudo systemctl enable named
    sudo chown root:named /etc/named.conf
    sudo chmod 600 /etc/named.conf

    if [ -e `pwd`/ntp.conf ]; then
      if [ -e /etc/ntp.conf ]; then
        sudo rm -rf /etc/ntp.conf
      fi
    fi
    sudo cp `pwd`/ntp.conf /etc/ntp.conf
    sudo chmod 644 /etc/ntp.conf
    #sudo systemctl enable ntpd
    #sudo systemctl reload ntpd

    if [ -e `pwd`/mkinitcpio.conf ]; then
      if [ -e /etc/mkinitcpio.conf ]; then
        sudo rm -rf /etc/mkinitcpio.conf
      fi
    fi
    sudo cp `pwd`/mkinitcpio.conf /etc/mkinitcpio.conf
    sudo chmod 644 /etc/mkinitcpio.conf
  
    echo "Shutting down NIS" 
    sudo systemctl stop ypbind
    sudo systemctl stop rpcbind
    if [ -e `pwd`/yp.conf ]; then
      if [ -e /etc/yp.conf ]; then
        sudo rm -rf /etc/yp.conf
      fi
    fi
    sudo cp `pwd`/yp.conf /etc/yp.conf
    sudo chmod 644 /etc/yp.conf
    sudo chown root:root /etc/yp.conf
    #echo "Starting NIS"
    #sudo systemctl start rpcbind
    #sudo systemctl start ypbind
    sudo domainname UofC

    if [ -e `pwd`/Xwrapper.config ]; then
      if [ -e /etc/X11/Xwrapper.config ]; then
        sudo rm -rf /etc/X11/Xwrapper.config
      fi
    fi
    sudo cp `pwd`/Xwrapper.config /etc/X11/Xwrapper.config
    sudo chmod 644 /etc/X11/Xwrapper.config
    sudo chown root:root /etc/X11/Xwrapper.config

    #remove anything installed by cpan even if it was done by root
    #https://wiki.archlinux.org/index.php/Perl_Policy
    sudo rm -rf /usr/lib/perl5/site_perl/*
    sudo rm -rf /usr/share/perl5/site_perl/*
    #actually remove cpan
    sudo rm -rf /usr/bin/core_perl/cpan
    sudo rm -rf /usr/share/man/man1/cpan.1perl.gz

    #delete npm global packages (other than npm)
    #sudo mkdir -p /usr/lib/node_modules
    #npm ls -gp --depth=0 | awk -F/node_modules/ '{print $2}' | grep -vE '^(npm|)$' | xargs -r npm -g rm
    #sudo npm ls -gp --depth=0 | awk -F/node_modules/ '{print $2}' | grep -vE '^(npm|)$' | xargs -r npm -g rm
    #sudo pacman -Rs npm --noconfirm 2> /dev/null
    #remove node_modules across the entire system
    #sudo find / -type d -name 'node_modules' -exec rm -rf {} \; >/dev/null
    #sudo pacman -S npm --force --noconfirm 2> /dev/null

    #lib hacks
    #sudo ln -s /usr/lib/libgnutls.so.30 /usr/lib/libgnutls.so.28

    if [ -e `pwd`/99-sysctl.conf ]; then
      if [ -e /etc/sysctl.d/99-sysctl.conf ]; then
        sudo rm -rf /etc/sysctl.d/99-sysctl.conf
      fi
    fi
    sudo cp `pwd`/99-sysctl.conf /etc/sysctl.d/99-sysctl.conf
    sudo chown root:root /etc/sysctl.d/99-sysctl.conf
    sudo chmod 644 /etc/sysctl.d/99-sysctl.conf

    #Make sure this is beloved neve and that we are logged on locally before doing X stuff
    if [ -e /usr/bin/xmonad ]; then
        if [[ -z "$SSH_TTY" && `uname -a` =~ ARCH ]]; then
            echo "Recompiling and restarting xmonad..."
            #This appears to restart xmobar as well, the pid of xmobar changes.
            #It didn't used to do this.
            xmonad --recompile; 
            xmonad --restart;
            #echo pgrep xmobar: `pgrep xmobar`
            #echo count:  `pgrep xmobar | wc`
            #for pid in `pgrep xmobar`; do
            #    echo pid: $pid
            #done
            #echo "Starting xmobar..."
            #xmobar &
            xrdb -load ~/.Xresources
        fi
    fi
    echo "Finishing Arch Only Configuration..."
fi

if [[ `uname -a` =~ Darwin ]]; then
    echo "Doing OS X Specific Configurations..."
    provisioning_file visual-studio-code-settings.json ~/Library/ApplicationSupport/Code/User/settings.json 600 `whoami` `id -gn`
    
    if [ -e ~/.inputrc ]; then
        rm -rf ~/.inputrc
    fi
    cp `pwd`/inputrc ~/.inputrc
    
    #This should always be last in the ordering for Darwin.
    if [ -e ~/.bashrc ]; then
        rm -rf ~/.bashrc
    fi
    #cp `pwd`/bashrc ~/.bash_profile
    cp `pwd`/bashrc ~/.bashrc
    #source ~/.bash_profile
    
    if [ -e `pwd`/hosts ]; then
        if [ -e /etc/hosts.ac ]; then
            sudo rm -rf /etc/hosts.ac
        fi
    fi
    sudo cp `pwd`/hosts /etc/hosts.ac
    sudo chmod 444 /etc/hosts.ac
    
    if [ -e `pwd`/hosts ]; then
        if [ -e /etc/hosts ]; then
            sudo rm -rf /etc/hosts
        fi
    fi
    sudo cp `pwd`/hosts /etc/hosts
    sudo chmod 444 /etc/hosts

    if [ ! -f "~/.bash_sessions_disable" ]; then
      touch ~/.bash_sessions_disable
    fi

    if [ -e "~/.passwd-s3fs" ]; then
        rm -rf ~/.passwd-s3fs
    fi
    cp `pwd`/passwd-s3fs ~/.passwd-s3fs
    chmod 600 ~/.passwd-s3fs 

    # disable press and hold, 10.10
    defaults write -g ApplePressAndHoldEnabled -bool false
  
    # disable copying colors from terminal 10.11
    defaults write com.apple.Terminal CopyAttributesProfile com.apple.Terminal.no-attributes

    # enable locate
    sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

    # show all finder files
    defaults write com.apple.finder AppleShowAllFiles TRUE
   
    # disable swipe scrolling with Chrome
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

    # dont show desktop icons.
    defaults write com.apple.finder CreateDesktop false
fi

blackbox_shred_all_files
echo "Done running build_me.sh..."
