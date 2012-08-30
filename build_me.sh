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

    if [ -e ~/.offlineimaprc ]; then
        rm -rf ~/.offlineimaprc
    fi 
    cp `pwd`/offlineimaprc ~/.offlineimaprc

    if [ -e ~/.screenrc ]; then
    rm -rf ~/.screenrc
    fi 
    cp `pwd`/screenrc ~/.screenrc

    if [ -e ~/.vimrc ]; then
        rm -rf ~/.vimrc
    fi 
    cp `pwd`/vimrc ~/.vimrc
fi

if [[ `uname -a`  =~ ARCH ]]; then
    echo "Doing Arch Only Configuration"

    if [ -e ~/.bashrc ]; then
        rm -rf ~/.bashrc
    fi
    cp `pwd`/bashrc ~/.bash_profileh
    
    if [ -e /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf ]; then
        sudo rm -rf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf  
    fi
    sudo cp `pwd`/90-graphics-hypervisor.conf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf 

    mkdir -p ~/.xmonad
    if [ -e ~/.xmonad/xmonad.hs ]; then
        rm -rf ~/.xmonad/xmonad.hs 
    fi
    cp `pwd`/xmonad.hs  ~/.xmonad/xmonad.hs 

    if [ -e /usr/bin/xmonad ]; then
        xmonad --recompile
    fi    

    if [ -e ~/.Xdefaults ]; then
        rm -rf ~/.Xdefaults
    fi
    cp `pwd`/Xdefaults ~/.Xdefaults

    if [ -e ~/.Xresources ]; then
        rm -rf ~/.Xresources
    fi
    cp `pwd`/Xresources ~/.Xresources

    if [ -e ~/.xinitrc ]; then
        rm -rf ~/.xinitrc
    fi
    cp `pwd`/xinitrc ~/.xinitrc

    if [ -e /etc/syslog-ng/syslog-ng.conf ]; then
        sudo rm -rf /etc/syslog-ng/syslog-ng.conf
    fi
    sudo cp `pwd`/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

    if [ -e /etc/iptables/iptables.rules ]; then
        echo "/etc/iptables/iptables.rules already exists, not over-writing."
    else 
        sudo cp `pwd`/iptables.rules /etc/iptables/iptables.rules
    fi
fi

if [[ `uname -a`  =~ Darwin ]]; then
    echo "Doing Arch / OS X Neutral Configurations."
    
    if [ -e ~/.bashrc ]; then
        rm -rf ~/.bashrc
    fi
    cp `pwd`/bashrc ~/.bash_profile
fi
echo "Done..."
