#!/bin/sh
#OS Config Bootstrap 
#Dan Sullivan

echo "Building OS Configuration"

if [[ `uname -a`  =~ ARCH || `uname -a` =~ Darwin ]]; then
    echo "Doing Arch / OS X Neutral Configurations."

    if [ -e ~/.aliases-private ]; then
        rm -rf ~/.aliases-private
    fi
    cp  `pwd`/aliases-private ~/.aliases-private

    if [ -e ~/.aliases ]; then
        rm -rf ~/.aliases
    fi
    cp `pwd`/aliases ~/.aliases

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

    if [ -e ~/imapfilter.conf ]; then
        rm -rf ~/.imapfilter
    fi
    mkdir -p ~/.imapfilter/
    cp `pwd`/imapfilter.conf ~/.imapfilter/config.lua

    if [ -e ~/.screenrc ]; then
    rm -rf ~/.screenrc
    fi 
    cp `pwd`/screenrc ~/.screenrc

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
    
    if [ -e `pwd`/ircrc ]; then
        if [ -e ~/.ircrc ]; then
            rm -rf ~/.ircrc
        fi
    fi
    cp `pwd`/ircrc ~/.ircrc
    
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
    
    if [ -e `pwd`/fstab-private ]; then
        if [ -e /etc/fstab-private ]; then
            sudo rm -rf /etc/fstab
        fi
    fi
    sudo cp `pwd`/fstab-private /etc/fstab

    if [ -e `pwd`/pinerc ]; then
        if [ -e ~/.pinerc ]; then
            sudo rm -rf ~/.pinerc
        fi
    fi
    sudo cp `pwd`/pinerc ~/.pinerc

    if [ -e `pwd`/smb.conf-private ]; then
        if [ -e /etc/samba/smb.conf ]; then
            sudo rm -rf /etc/samba/smb.conf
        fi
    fi
    sudo cp `pwd`/smb.conf-private /etc/samba/smb.conf
    sudo chmod 644 /etc/samba/smb.conf
    sudo /etc/rc.d/samba restart

    #Install misc scripts.  This should be last in this if block.
    if [ -e ../misc_scripts/build_me.sh ]; then
        ../misc_scripts/build_me.sh
    fi
fi

if [[ `uname -a`  =~ ARCH ]]; then
    echo "Doing Arch Only Configuration."

    if [ -e ~/.mcabberrc ]; then
        rm -rf ~/.mcabberrc
    fi
    cp `pwd`/mcabberrc ~/.mcabberrc
    
    
    if [ -e /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf ]; then
        sudo rm -rf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf
    fi
    sudo cp `pwd`/90-graphics-hypervisor.conf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf 

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
    
    if [ -e /usr/bin/xmonad ]; then
        echo "Recompiling and restarting xmonad..."
        #This appears to restart xmobar as well, the pid of xmobar changes.
        #It didn't used to do this.
        xmonad --recompile; xmonad --restart;
        #echo pgrep xmobar: `pgrep xmobar`
        #echo count:  `pgrep xmobar | wc`
        #for pid in `pgrep xmobar`; do
        #    echo pid: $pid
        #done
        #echo "Starting xmobar..."
        #xmobar &
    fi

    if [ -e ~/.Xdefaults ]; then
        rm -rf ~/.Xdefaults
    fi
    cp `pwd`/Xdefaults ~/.Xdefaults

    if [ -e ~/.Xresources ]; then
        rm -rf ~/.Xresources
    fi
    cp `pwd`/Xresources ~/.Xresources
    xrdb -load ~/.Xresources

    if [ -e ~/.xinitrc ]; then
        rm -rf ~/.xinitrc
    fi
    cp `pwd`/xinitrc ~/.xinitrc

    if [ -e /etc/syslog-ng/syslog-ng.conf ]; then
        sudo rm -rf /etc/syslog-ng/syslog-ng.conf
    fi
    sudo cp `pwd`/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf
    
    if [ -e /etc/syslog-ng/syslog-ng-private.conf ]; then
        sudo rm -rf /etc/syslog-ng/syslog-ng-private.conf
    fi
    sudo cp `pwd`/syslog-ng.conf /etc/syslog-ng/syslog-ng-private.conf
    sudo /etc/rc.d/syslog-ng restart

    if [ -e /etc/iptables/iptables.rules ]; then
        sudo rm -rf /etc/iptables/iptables.rules
    fi
    sudo cp `pwd`/iptables.rules-private /etc/iptables/iptables.rules
    sudo /etc/rc.d/iptables restart
    
    if [ -e `pwd`/hosts-private ]; then
        if [ -e /etc/hosts ]; then
            sudo rm -rf /etc/hosts 
        fi
    fi
    sudo cp `pwd`/hosts-private /etc/hosts
    sudo chmod 444 /etc/hosts
   
    #This should always be last in the ordering for Arch.
    if [ -e ~/.bashrc ]; then
        rm -rf ~/.bashrc
    fi
    cp `pwd`/bashrc ~/.bashrc
    source ~/.bashrc
fi

if [[ `uname -a`  =~ Darwin ]]; then
    echo "Doing Arch / OS X Neutral Configurations."
    
    source ~/.bash_profile

    if [ -e ~/.inputrc ]; then
        rm -rf ~/.inputrc
    fi
    cp `pwd`/inputrc ~/.inputrc
    
    #This should always be last in the ordering for Darwin.
    if [ -e ~/.bashrc ]; then
        rm -rf ~/.bashrc
    fi
    cp `pwd`/bashrc ~/.bash_profile
fi

echo "Done..."
