# /-------------------------\ #
#<-[ nate-wilkins/dotfiles ]->#
# \-------------------------/ #

# ask for root.
sudo -v

# -[ dependencies ]------------------------------------------- #
# /
sudo apt install curl
sudo apt install git
sudo apt install keychain
sudo apt install emacs25
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


# -[ fonts ]-------------------------------------------------- #
# /

# <xero/figlet>
sudo git clone https://github.com/xero/figlet-fonts         /usr/share/figlet/figlet-fonts

# <adobe-fonts/source-code-pro>
[ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype
sudo git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
sudo fc-cache -f -v

# -[ dotfiles ]----------------------------------------------- #
# /
FRESH_LOCAL_SOURCE=Nate-Wilkins/dotfiles
git clone https://github.com/freshshell/fresh ~/.fresh/source/freshshell/fresh
# TODO: needed? :: echo "fresh freshshell/fresh bin/fresh --bin" > ~/.freshrc
~/.fresh/source/freshshell/fresh/bin/fresh
cp -fr ~/.dotfiles/.freshrc ~/.freshrc
