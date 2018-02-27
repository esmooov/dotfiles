#!/usr/bin/env bash

# /-------------------------\ #
#<-[ nate-wilkins/dotfiles ]->#
# \-------------------------/ #

# uses base16-builder
#
# schemes
# - solarized
# - codeschool
# - flat
# - darktooth
DOTFILES_SCHEME=harmonic
DOTFILES_THEME=dark


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

# -[ theme ]-------------------------------------------------- #
# /
[ -d .theme/ ] && rm -rf tmp/
mkdir -p .theme/

# - spacemacs
mkdir -p ~/.spacemacs.d/private/local/base16-$($DOTFILES_SCHEME)16-$($DOTFILES_THEME)-theme
SPACEMACS_THEME=~/.spacemacs.d/private/local/base16-$($DOTFILES_SCHEME)16-$($DOTFILES_THEME)-theme/base16-$($DOTFILES_SCHEME)16-$($DOTFILES_THEME).el
[ -f $SPACEMACS_THEME ] && rm -f $SPACEMACS_THEME
base16-builder -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t emacs > $SPACEMACS_THEME

# - bspwm
base16-builder   -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t bspwm > .theme/bspwm.color.sh

# - dmenu
DMENU_COLOR=$(base16-builder   -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t dmenu | grep -q '^[^#]*$')
echo alias dmenu="$DMENU_COLOR" >                                  .theme/dmenu.color-shell.sh

# - termite
base16-builder -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t termite > .theme/termite.color

# TODO: chrome-devtools :: find config location
#       base16-builder -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t chrome-devtools

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
