#!/bin/sh
#This script written by Dan Sullivan

echo "Building symbolic links..."

if [[ `uname -a`  =~ ARCH ]]; then
    echo "Arch linux detected."
else 
    echo "This script is intended for Arch Linux."
    exit
fi

if [ -e ~/.bashrc ]; then
    rm -rf ~/.bashrc
fi
ln -s `pwd`/.bashrc

if [ -e /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf ]; then
sudo rm -rf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf  
fi
sudo ln -s `pwd`/90-graphics-hypervisor.conf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf 

if [ -e ~/.aliases-private ]; then
    rm -rf ~/.aliases-private
fi
ln -s `pwd`/aliases-private ~/.aliases-private

if [ -e ~/.aliases ]; then
    rm -rf ~/.aliases
fi
ln -s `pwd`/aliases    ~/.aliases

if [ -e ~/.functions ]; then
    rm -rf ~/.functions
fi
ln -s `pwd`/functions    ~/.functions

echo "Done..."
