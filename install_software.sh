#!/bin/sh
#Dan Sullivan
#Arch Linux package installer
#Started 12/28/2012
#Actually ran this for the first time on 9/2/2013.
#This appears to have actually worked.
#Chronological for nostalgic purposes :-)
#Yauort should be installed prior to running this script

#first, update the database 
sudo pacman -Syy

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
#install xmonad-contrib
sudo pacman -S xmonad-contrib --noconfirm
#install xmonad
sudo pacman -S xmonad --noconfirm
#commented this out for gvim 6/20/2013
#install vim
#sudo pacman -S vim --noconfirm
#install xrdb
sudo pacman -S xorg-xrdb --noconfirm
#install screen
sudo pacman -S screen --noconfirm
#install syslog-ng
sudo pacman -S syslog-ng --noconfirm
#install rdesktop
sudo pacman -S rdesktop --noconfirm
#install profont
sudo pacman -S profont --noconfirm
#install the ati video driver
sudo pacman -S xf86-video-ati --noconfirm
#install the open sourve nvidia drivers
#commented out nouveau 9/2/2013
#sudo pacman -S xf86-video-nouveau --noconfirm
#clip
sudo pacman -S xclip --noconfirm
#install offlineimap
sudo pacman -S offlineimap --noconfirm
#lua
sudo pacman -S lua --noconfirm
#git
sudo pacman -S git --noconfirm
#mutt
sudo pacman -S mutt --noconfirm
#seahorse, gnome keyring
sudo pacman -S seahorse --noconfirm
#openssh
sudo pacman -S openssh --noconfirm
#xlock
sudo pacman -S xlockmore --noconfirm
#nmap
sudo pacman -S nmap --noconfirm
#ruby
sudo pacman -S ruby --noconfirm
#yajl (required for yaourt)
sudo pacman -S yajl --noconfirm
#wireshark-gtk
sudo pacman -S wireshark-gtk --noconfirm
#whois
sudo pacman -S whois --noconfirm
#for screen capture
sudo pacman -S imagemagick --noconfirm
#mcabber
sudo pacman -S mcabber --noconfirm
#evince
sudo pacman -S evince --noconfirm
#for mysql ruby library
sudo pacman -S libmysqlclient --noconfirm
#libxslt, needed for ruby dev
sudo pacman -S libxslt --noconfirm
#strace, needed for debugging
sudo pacman -S strace --noconfirm
#netbeans ide
sudo pacman -S netbeans --noconfirm
#libreoffice
sudo pacman -S libreoffice --noconfirm
#english language pack
sudo pacman -S libreoffice-en-US --noconfirm
#unzip
sudo pacman -S unzip --noconfirm
#epic4 irc
sudo pacman -S epic4 --noconfirm
#memcached, for rails development
sudo pacman -S memcached --noconfirm
#cvs
sudo pacman -S cvs --noconfirm
#sshfs
sudo pacman -S sshfs --noconfirm
#cdrkit, for burning iso images 4/9/2013
sudo pacman -S cdrkit --noconfirm
#lsof 4/12/2013
sudo pacman -S lsof --noconfirm
#iotop 5/3/2013
sudo pacman -S iotop --noconfirm
#dstat 5/4/203
sudo pacman -S dstat --noconfirm
#mercurial 5/4/2013
sudo pacman -S mercurial --noconfirm
#hdparm 5/6/2013
sudo pacman -S hdparm --noconfirm
#sysstam 5/6/2013
sudo pacman -S sysstat --noconfirm
#userland utilities
sudo pacman -S iptables --noconfirm
#icedtea-web-java7
sudo pacman -S icedtea-web-java7 --noconfirm
#xfd (to show font characters)
sudo pacman -S xorg-xfd --noconfirm
#xfontsel
sudo pacman -S xorg-xfontsel --noconfirm
#character map utility 5/14/2013
sudo pacman -S gucharmap --noconfirm
#cabal
sudo pacman -S cabal-install --noconfirm
#install reflector
sudo pacman -S reflector --noconfirm
#for wish, needed for tk
sudo pacman -S tk --noconfirm
#svn #5/31/2913
sudo pacman -S svn --noconfirm
#traceroute
sudo pacman -S traceroute --noconfirm
#openldap
sudo pacman -S openldap --noconfirm
#xwininfo
sudo pacman -S xorg-xwininfo --noconfirm
#xkill
sudo pacman -S xorg-xkill --noconfirm
#gimp
sudo pacman -S gimp --noconfirm
#install dmenu
sudo pacman -S dmenu --noconfirm
#gvim 6/20/2013
sudo pacman -S gvim --noconfirm
#gnome desktop 7/1/2013
#sudo pacman -S gnome-desktop --noconfirm
#openvpn 7/19/2013
sudo pacman -S openvpn --noconfirm
#zsh 7/22/2013
sudo pacman -S zsh --noconfirm
#xinput
sudo pacman -S xorg-xinput --noconfirm
#iftop
sudo pacman -S iftop --noconfirm
#autocutsel for clipboard integration
sudo pacman -S autocutsel --noconfirm
#dmraid
sudo pacman -S dmraid --noconfirm
#xfce4-terminal
sudo pacman -S xfce4-terminal --noconfirm
#glib2
sudo pacman -S glib2 --noconfirm
#snmpd 8/31/2013
sudo pacman -S net-snmp --noconfirm
#gnome3
#sudo pacman -S gnome --noconfirm
#flash plugin 9/2
sudo pacman -S flashplugin --noconfirm
#keepass-x
#sudo pacman -S keepassx --noconfirm
sudo pacman -S keepassx2 --noconfirm
#mlocate
sudo pacman -S mlocate --noconfirm
sudo updatedb
#evince
sudo pacman -S evince --noconfirm
#ntp
sudo pacman -S ntp --noconfirm
#to install gnome-autogen.sh for compiling gnome-vnc
sudo pacman -S gnome-common --noconfirm
#intltool for compiling gnome-vnc
sudo pacman -S intltool --noconfirm
#install tcpdump 9/30/2013
sudo pacman -S tcpdump --noconfirm
#thunderbird 10/25/2013
sudo pacman -S thunderbird --noconfirm
#truecrypt
sudo pacman -S truecrypt --noconfirm
#mysql (apparently this installs MariaDB)? 10/25/2013
sudo pacman -S mysql --noconfirm
#chromium 10/25/2013
sudo pacman -S chromium --noconfirm
#rrdtool 10/25/2013
sudo pacman -S rrdtool --noconfirm
#aspell dictionary tool 11/1/2013
sudo pacman -S aspell --noconfirm
#aspell english dictionary
sudo pacman -S aspell-en --noconfirm
#monodevelop
sudo pacman -S monodevelop --noconfirm
#linux headers
sudo pacman -S linux-headers --noconfirm
#install alsa-utils, for audio
sudo pacman -S alsa-utils --noconfirm
#apache ant 11/19/2013
sudo pacman -S apache-ant --noconfirm
#opera 11/20/2013
sudo pacman -S opera --noconfirm
#bind
sudo pacman -S bind --noconfirm
#install cronie (should be installed by default) 12/2/2013
sudo pacman -S cronie --noconfirm
#broadcom firmware cutter tool 12/15/2013
sudo pacman -S b43-fwcutter --noconfirm
#base-devel, for strip and other utilities
sudo pacman -S base-devel --noconfirm
#wpa_supplicant 12/15/2015
sudo pacman -S wpa_supplicant --noconfirm
#command line wireless config 12/16/2013
sudo pacman -S iw --noconfirm
#apvlv is a pdf reader with vim-like keybindings
sudo pacman -S apvlv --noconfirm
#color dropper 1/2/2014
sudo pacman -S gcolor2 --noconfirm
#nodejs (for npm) 1/2/2014
sudo pacman -S nodejs --noconfirm
#phamtomjs
sudo pacman -S phantomjs --noconfirm
#xprop, examine the properties of an x window 1/8/2014
sudo pacman -S xorg-xprop --noconfirm
#appres
sudo pacman -S xorg-appres --noconfirm
#baobab, disk reporting
#sudo pacman -S baobab --noconfirm
#xdiskusage
sudo pacman -S xdiskusage --noconfirm
#ntpd 
sudo pacman -S ntp --noconfirm
#
sudo pacman -S postgresql-libs --noconfirm
#node
sudo pacman -S nodejs --noconfirm
#gnuplut
sudo pacman -S gnuplot --noconfirm
#
sudo pacman -S mongodb --noconfirm
#dmidecode 10/8/2014
sudo pacman -S dmidecode --noconfirm

#NIS client (not server) 6/10/2015
sudo pacman -S yp-tools --noconfirm
pacman -S ypbind-mt --noconfirm

#systemd 6/10/2015
sudo pacman -S systemd --noconfirm

#this block for chromium 6/11/2015
sudo pacman -S icu --noconfirm
sudo pacman -S libvpx --noconfirm
sudo pacman -S gnutls --noconfirm
sudo pacman -S pciutils --noconfirm
sudo pacman -S libcups --noconfirm
sudo pacman -S chromium --noconfirm

#this block for firefox 
sudo pacman -S firefox --noconfirm
sudo pacman -S nss --noconfirm
sudo pacman -S sqllite --noconfirm
sudo pacman -S ca-certificates --noconfirm
sudo pacman -S firefox --noconfirm

#perlbrew 6/11/2015
sudo pacman -S perlbrew --noconfirm

#php for dokuwiki 6/16/2015
sudo pacman -S php --noconfirm

#boost, for building TORQUE 6/19/2015
sudo pacman -S boost --noconfirm

sudo pcaman -S xorg-xmodmap --noconfirm

#npm 10/21/2015
sudo pacman -S npm --noconfirm

#virtualenv
sudo pacman -S python2-virtualenv --noconfirm

#wkhtmltopdf 12/7/2015
sudo pacman -S wkhtmltopdf --noconfirm

#for gtk2 themes
sudo pacman -S mate-themes --noconfirm

#xfce
sudo pacman -S xfce4 --noconfirm

#pandoc, convert docx to pdf
sudo pacman -S pandoc --noconfirm

#remmina, tabbed rdp client
sudo pacman -S remmina --noconfirm

#freerdp (required for remmina rdp support)
sudo pacman -S freerdp --noconfirm

###post install tasks###
#re-hash fonts directory
sudo xset fp rehash
#build font information cache files
sudo fc-cache
###end post install tasks###

#dynagen, required for gns3
yaourt -S dynagen --noconfirm
#python2-pyqt4, required for gns3
yaourt -S python-pyqtr --noconfirm
#gns3 network simulator
yaourt -S gns3 --noconfirm
#10/31/2013 imapfilter
yaourt -S imapfilter --noconfirm
#b43-firmware 12/15/2013
yaourt -S b43-firmware --noconfirm
#xfce4 task bar panel
yaourt -S xfce4-taskbar-plugin --noconfirm --insecure

#anyconnect 4/23/2015
#sudo yaourt -S gnutls --noconfirm
sudo yaourt -S openconnect --noconfirm
sudo yaourt -S nettle --noconfirm
