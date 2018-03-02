#!/usr/bin/env bash

# /-------------------------\ #
#<-[ nate-wilkins/dotfiles ]->#
# \-------------------------/ #


# -[ configuration ]------------------------------------------ #
# /
# - source directory
#   https://stackoverflow.com/a/246128/422312
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
ROOT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


# -[ parse arguments ]---------------------------------------- #
# /
if    [[ $# -eq 0 ]]; then set -- "--help"; fi
while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    -se|--skip-encrypted)
      DOTFILES_SKIP_ENCRYPTED=yes
      shift
      ;;
    -s|--scheme)
      DOTFILES_SCHEME="$2"
      shift
      shift
      ;;
    -t|--theme)
      DOTFILES_THEME="$2"
      shift
      shift
      ;;
    *)
      echo "Usage:                                                         "
      echo "  sudo bash install.sh                                         "
      echo "                                                               "
      echo "Options:                                                       "
      echo "  -s | --scheme              specify a different color scheme. "
      echo "  -t | --theme  (dark|light) specify a different color theme.  "
      echo "  -se| --skip-encrypted      skips encrypted doftiles.         "
      echo "                                                               "
      echo "Example:                                                       "
      echo "  sudo bash install.sh                                         "
      echo "  sudo bash install.sh --skip-encrypted                        "
      shift
      exit 1
      ;;
  esac
done

# root check?
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Unable to proceed. Script must be run as root."
    echo "  sudo bash install.sh"
    exit -2
fi

# - base16-builder schemes
#     solarized
#     codeschool
#     flat
#     darktooth
DOTFILES_SCHEME=${DOTFILES_SCHEME:=harmonic}
DOTFILES_THEME=${DOTFILES_THEME:=dark}
DOTFILES_SKIP_ENCRYPTED=${DOTFILES_SKIP_ENCRYPTED:=no}

echo "                                          "
echo "< starting install >                      "
echo "                                          "
echo "[vars]                                    "
echo "dirname=$ROOT_DIR                         "
echo "--scheme=$DOTFILES_SCHEME                 "
echo "--theme=$DOTFILES_THEME                   "
echo "--skip-encrypted=$DOTFILES_SKIP_ENCRYPTED "
echo "                                          "

# -[ dependencies ]------------------------------------------- #
# /
# - nodejs
if hash npm 2>/dev/null; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
    chmod +x ~/.nvm/nvm.sh
    . ~/.nvm/nvm.sh
    nvm install node
fi

# - base16-builder
npm install --global base16-builder

# -[ theme ]-------------------------------------------------- #
# /
[ -d $ROOT_DIR/.theme/ ] && rm -rf $ROOT_DIR/.theme/
mkdir -p $ROOT_DIR/.theme/

# - spacemacs
# TODO: should output to ROOT_DIR and freshen with freshrc.
#       also need ability for spacemacs to support custom.
mkdir -p ~/.spacemacs.d/private/local/base16-${DOTFILES_SCHEME}16-${DOTFILES_THEME}-theme
SPACEMACS_THEME=~/.spacemacs.d/private/local/base16-${DOTFILES_SCHEME}16-${DOTFILES_THEME}-theme/base16-${DOTFILES_SCHEME}16-${DOTFILES_THEME}.el
[ -f $SPACEMACS_THEME ] && rm -f $SPACEMACS_THEME
base16-builder -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t emacs > $SPACEMACS_THEME

# - bspwm
[ -f $ROOT_DIR/.theme/bspwm.color.sh ] && rm -f $ROOT_DIR/.theme/bspwm.color.sh
base16-builder   -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t bspwm > $ROOT_DIR/.theme/bspwm.color.sh

# - dmenu
[ -f $ROOT_DIR/.theme/dmenu.color-shell.sh ] && rm -f $ROOT_DIR/.theme/dmenu.color-shell.sh
DMENU_COLOR=$(base16-builder   -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t dmenu | grep -q '^[^#]*$')
echo alias dmenu="$DMENU_COLOR" >                                  $ROOT_DIR/.theme/dmenu.color-shell.sh

# - termite
[ -f $ROOT_DIR/.theme/termite.color ] && rm -f $ROOT_DIR/.theme/termite.color
base16-builder -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t termite > $ROOT_DIR/.theme/termite.color

# TODO: chrome-devtools :: find config location
#       base16-builder -s $DOTFILES_SCHEME -b $DOTFILES_THEME -t chrome-devtools

# -[ fresh ]-------------------------------------------------- #
# /
[ -d ~/.fresh ]   && rm -rf ~/.fresh
[ -f ~/.freshrc ] && rm -f  ~/.freshrc
# cleanup fresh symlinks.
find ~/ -lname ~/.fresh/* -delete

# make freshrc available for fresh.
cp $ROOT_DIR/.freshrc ~/.freshrc

# write variables for fresh.
[ -f ~/.freshvars ] && rm -f ~/.freshvars
echo "DOTFILES_SKIP_ENCRYPTED=${DOTFILES_SKIP_ENCRYPTED}" > ~/.freshvars
chmod +x ~/.freshvars

  FRESH_LOCAL_SOURCE=$USER/dotfiles
  runuser -l $USER -c 'source <(curl -sL https://get.freshshell.com)'

# sourced in .zshrc
chmod +x ~/.fresh/build/shell.sh
