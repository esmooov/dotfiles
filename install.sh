#!/usr/bin/env bash

# /-------------------------\ #
#<-[ nate-wilkins/dotfiles ]->#
# \-------------------------/ #

[ -d /home/$1/.fresh ]   && rm -rf /home/$1/.fresh
[ -f /home/$1/.freshrc ] && rm -f  /home/$1/.freshrc
find /home/$1/ -lname "/home/$1/.fresh/*" -delete

cp /home/$1/.dotfiles/.freshrc /home/$1/.freshrc

FRESH_LOCAL_SOURCE=$1/dotfiles
runuser -l $1 -c 'source <(curl -sL https://get.freshshell.com)'
