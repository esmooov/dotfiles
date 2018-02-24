#!/usr/bin/env zsh

# /-------------------------\ #
#<-[    dotfiles/.zshrc    ]->#
# \-------------------------/ #

# -[ antigen ]------------------------------------------------ #
# /
source ~/antigen.zsh

# - config
# oh-my-zsh
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# - usings
antigen use oh-my-zsh

# - plugins
antigen bundle git
antigen bundle bgnotify
antigen bundle copybuffer
antigen bundle cp
antigen bundle history
antigen bundle gulp
antigen bundle mix
antigen bundle jsontools
antigen bundle heroku
antigen bundle git-flow
antigen bundle command-not-found
antigen bundle nyan
antigen bundle emoji

antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-syntax-highlighting

# - theme
antigen theme halfo/lambda-mod-zsh-theme

# - apply
antigen apply
# \
# -[ antigen ]------------------------------------------------ #


# -[ other ]-------------------------------------------------- #
# /
# - keychain
eval $(keychain --eval github-god_rsa)
# \
# -[ other ]-------------------------------------------------- #
