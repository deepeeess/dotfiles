#!/bin/sh
#Dan Sullivan
#Arch Linux package installer
#Started 12/28/2012
#Chronological for nostalgic purposes :-)
sudo pacman -S lynx --noconfirm
sudo pacman -S xmobar --noconfirm
#print ascii tables
sudo pacman -S ascii --noconfirm
#flex required for snort, 12/12/2012
sudo pacman -S flex --noconfirm
#bison required for snort, 12/12/2012
sudo pacman -S bison --noconfirm
#rsync, for backups
sudo pacman -S rsync --noconfirm
#to control x remotely
sudo pacman -S xdotool --noconfirm
#python setuptools
sudo pacman -S setuptools --noconfirm
#python gnomekeyring module
sudo pacman -S python2-gnomekeyring --noconfirm
#install TigerVNC, works with OS X 10.8
#sudo pacman -S tigervnc --noconfirm
#required for mu 1.15.2013
sudo pacman -S pkg-config --noconfirm
#required for mu 1.25.2013
sudo pacman -S gmime --noconfirm
#quick and dirty image viewer, needed for my mailcap
sudo pacman -S mirage --noconfirm
#install pexpect
sudo pacman -S python2-pexpect --noconfirm
#install samba
sudo pacman -S samba --noconfirm
