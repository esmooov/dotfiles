#!/usr/bin/env bash

# /-------------------------\ #
#<-[ nate-wilkins/dotfiles ]->#
# \-------------------------/ #

root_dir=`dirname $0`

# -[ dependencies ]------------------------------------------- #
# /
sudo apt install curl
sudo apt install git
sudo apt install keychain
sudo apt install emacs25
sudo apt install net-tools

# [ -d ~/.emacs.d ] && rm -r ~/.emacs.d
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


# -[ fonts ]-------------------------------------------------- #
# /

# <xero/figlet>
git clone https://github.com/xero/figlet-fonts         /usr/share/figlet/figlet-fonts

# <adobe-fonts/source-code-pro>
# [ -d /usr/share/fonts/opentype ] && rm -r /usr/share/fonts/opentype
[ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype
sudo git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
sudo fc-cache -f -v

# -[ cleanup ]------------------------------------------------ #
# /
[ -d ~/.fresh ]   && rm -r ~/.fresh
[ -f ~/.freshrc ] && rm    ~/.freshrc

cp $root_dir/.freshrc ~/.freshrc
