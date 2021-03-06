# unset and resource all aliases
unalias -a
source ~/.aliases
source ~/.aliases-private

# unset all functions
for function in `declare -F | awk '{ print $3 }' `; do unset -f  "$function"; done
source ~/.functions
source ~/.functions-private

# check in ~/.functions for cntrl_c function
trap ctrl_c INT
trap hangup HUP
trap hangup KILL

# enable vi mode (set +o vi to revert)
set -o vi

# set the editor
export EDITOR="vim"

# enable timestamping on bash_history (type history to see timestamps)
export HISTTIMEFORMAT="%d.%m.%y %T "

#set the umask to prevent files from being created with access
#to group members or others
umask 0077

if [ `uname` == Darwin ]; then
    echo "Darwin detected in bashrc"
    #use UTF-8 for everything.
    export LC_ALL=en_US.UTF-8
    
    PATH=$PATH:/opt/local/bin
    PATH=$PATH:$HOME/scripts
    PATH=$PATH:~/.platformio/penv/bin
    PATH=$PATH:$HOME/Library/Python/3.7/bin #aws cli tools

    #Begin Brew Stuff
    PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
    #End Brew Stuff
    
    export ANDROID_HOME=$HOME/Library/Android
    export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
    export GOPATH=~/working/github/go
    PATH=$PATH:~/working/github/go/bin

    # brew Specific
    source /usr/local/etc/bash_completion.d/az
    
    # fastlane
    export PATH="$HOME/.fastlane/bin:$PATH"

    # gcloud
    if [ -f "$HOME/working/MacOS-Install/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/working/MacOS-Install/google-cloud-sdk/path.bash.inc"; fi
    if [ -f "$HOME/working/MacOS-Install/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/working/MacOS-Install/google-cloud-sdk/path.bash.inc"; fi

    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
    alias cd='cdnvm'

elif [ `uname` == Linux ]; then 
    echo "Linux box detected in bashrc"
    # init volume to 20.
    amixer sset Master 67% 
    PATH=$PATH:/opt/local/scripts
    PATH=$PATH:~/.cabal/bin
    PATH=$PATH:/usr/local/heroku/bin
    #vendor perl, for perlbrew
    PATH=$PATH:/usr/bin/vendor_perl
    #disable terminal beep
    setterm -blength 0
    if [ -z "${SSH_CONNECTION}" ]; then
        if [[ $TERMCAP =~ screen ]]; then
            echo "GNU screen is running..."
        else
            echo "GNU screen is not running..."
        fi
    else
        echo "This is not an SSH session..."
    fi
    #X Desktop Group Configuration Paths
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_CACHE_HOME=$HOME/.cache
    #use the default POSIX/C locale, print only standard ASCII characters.
    export LC_ALL=C
    export JAVA_HOME=/opt/local/jdk1.7.0_45
else
    echo "Unknown platform detected..."
fi

# from functions 
bash_prompt
loadrbenv

#see efnet/freenode bash shell functions in ~/functions
#export IRCSERVER="irc.servercentral.net 9999 IRC-SSL"
export IRCNICK="dps"
export IRCNAME="dan sullivan"

#Set CVS remote shell
export CVS_RSH=ssh

#exempt commands that start with spaces from ~/.bash_history
export HISTCONTROL=ignorespace

#if [[ $TERM == xterm || $TERM == "rxvt-unicode-256color" ]]; then
if [[ -z "$SSH_TTY" && `uname -a` =~ ARCH ]]; then
    #we know we are not logged in via ssh i.e. we are at the console
    echo "This looks like an xsession, running xset..."
    #disable audible beep for X11
    xset -b 
    #set the mouse tracking speed to fast
    xset m 7 10
    # set the keyboard repeat rate, karabiner 200, 10
    xset r rate 200 100
    
    #re-hash this with every load
    xrdb -load ~/.Xresources
    
    #verify settings
    #xrdb -query
else
    echo "This is an SSH session..."
fi


# wipe out old screens
screen -wipe > /dev/null
screen -list

if [ ! -d ~/.mcabber/otr ]; then
    #Mcabber is configured to automatically generate OTR keys.
    #https://github.com/dsulli99/arch_x86_64_configs/blob/master/mcabberrc
    echo "Configuring directory for mcabber OTR keys..."
    mkdir -p ~/.mcabber/otr
    chmod -R 700 ~/.mcabber
fi

if [ -e ~/perl5/perlbrew/etc/bashrc ]; then
  echo "initializing perlbrew"
  source ~/perl5/perlbrew/etc/bashrc
fi

if [ -e ~/.dotfiles-devopsrockstars/init ]; then
  source ~/.dotfiles-devopsrockstars/init
fi

if [ -e ~/working/github/arch_x86_64_configs/quick ]; then
  source ~/working/github/arch_x86_64_configs/quick
fi

cd ~/working/github
