#!/usr/bin/env bash

# /-------------------------\ #
#<-[ nate-wilkins/dotfiles ]->#
# \-------------------------/ #

root_dir=`dirname $0`

# -[ dependencies ]------------------------------------------- #
# /
apt install git
apt install keychain

# -[ cleanup ]------------------------------------------------ #
# /
[ -d ~/.fresh ]   && rm -r ~/.fresh
[ -f ~/.freshrc ] && rm    ~/.freshrc
cp $root_dir/.freshrc ~/.freshrc

FRESH_LOCAL_SOURCE=Nate-Wilkins/dotfiles
source <(curl -sL https://get.freshshell.com)
