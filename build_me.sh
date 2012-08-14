#!/bin/sh
#This script written by Dan Sullivan

echo "Building symbolic links..."

#if [ -e ~/.bashrc ]; then
#    rm -rf ~/.bashrc
#fi
#ln -s ~/Dropbox/arch_x86_64_configs/bashrc ~/.bashrc

if [ -e /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf ]; then
sudo rm -rf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf  
fi
sudo ln -s ~/Dropbox/arch_x86_64_configs/90-graphics-hypervisor.conf /etc/X11/xorg.conf.d/90-graphics-hypervisor.conf 

if [ -e ~/.aliases-private ]; then
    rm -rf ~/.aliases-private
fi
ln -s ~/Dropbox/arch_x86_64_configs/aliases-private ~/.aliases-private

if [ -e ~/.aliases ]; then
    rm -rf ~/.aliases
fi
ln -s ~/Dropbox/arch_x86_64_configs/aliases    ~/.aliases

if [ -e ~/.functions ]; then
    rm -rf ~/.functions
fi
ln -s ~/Dropbox/arch_x86_64_configs/functions    ~/.functions

echo "Done..."
