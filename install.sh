#!/usr/bin/env bash

# /-------------------------\ #
#<-[ nate-wilkins/dotfiles ]->#
# \-------------------------/ #

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Unable to proceed. Script must be run as root."
    echo "  sudo bash setup.sh"
    exit -2
fi

if [[ "$1" == "" ]]; then
    echo "Usage:                            "
    echo "  sudo bash setup.sh <user-name>  "
    echo "                                  "
    echo "Example:                          "
    echo "  sudo bash setup.sh nate-wilkins "
    exit 1
fi


# -[ dependencies ]------------------------------------------- #
# /
# - nodejs
if hash npm 2>/dev/null; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
    chmod +x "/home/$1/.nvm/nvm.sh"
    . "/home/$1/.nvm/nvm.sh"
    nvm install node
fi

# - base16-builder
npm install --global base16-builder


# -[ fresh ]-------------------------------------------------- #
# /
[ -d /home/$1/.fresh ]   && rm -rf /home/$1/.fresh
[ -f /home/$1/.freshrc ] && rm -f  /home/$1/.freshrc
find /home/$1/ -lname "/home/$1/.fresh/*" -delete

cp /home/$1/.dotfiles/.freshrc /home/$1/.freshrc

FRESH_LOCAL_SOURCE=$1/dotfiles
runuser -l $1 -c 'source <(curl -sL https://get.freshshell.com)'

# sourced in .zshrc
chmod +x /home/$1/.fresh/build/shell.sh
