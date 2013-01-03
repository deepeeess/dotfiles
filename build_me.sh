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

fi

if [[ `uname -a`  =~ ARCH ]]; then
    echo "Doing Arch Only Configuration."

    if [ -e ~/.mcabberrc ]; then
        rm -rf ~/.mcabberrc
    fi
    cp `pwd`/mcabberrc ~/.mcabberrc
    
    if [ -e ~/.bashrc ]; then
        rm -rf ~/.bashrc
    fi
    cp `pwd`/bashrc ~/.bashrc
    source ~/.bashrc
    
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

    if [ -e /etc/iptables/iptables.rules ]; then
        echo "/etc/iptables/iptables.rules already exists, not over-writing."
    else 
        sudo cp `pwd`/iptables.rules /etc/iptables/iptables.rules
    fi
    
    if [ -e `pwd`/hosts ]; then
        if [ -e /etc/hosts ]; then
            sudo rm -rf /etc/hosts 
        fi
    fi
    sudo cp `pwd`/hosts /etc/hosts
fi

if [[ `uname -a`  =~ Darwin ]]; then
    echo "Doing Arch / OS X Neutral Configurations."
    
    if [ -e ~/.bashrc ]; then
        rm -rf ~/.bashrc
    fi
    cp `pwd`/bashrc ~/.bash_profile
    source ~/.bash_profile

    if [ -e ~/.inputrc ]; then
        rm -rf ~/.inputrc
    fi
    cp `pwd`/inputrc ~/.inputrc
fi
echo "Done..."
