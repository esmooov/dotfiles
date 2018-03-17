#!/usr/bin/env zsh

# /-------------------------\ #
#<-[    dotfiles/.zshrc    ]->#
# \-------------------------/ #


# -[ configurations ]----------------------------------------- #
# /
# zsh
setopt autocd
setopt histignoredups
setopt menucomplete
setopt nolistbeep

# oh-my-zsh
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# - desyncr/auto-ls
AUTO_LS_PATH=true
# NOTE: Pulled from aliases.
AUTO_LS_COMMANDS=("/usr/local/bin/exa --long --group-directories-first --all --group --git" git-status)
# \
# ------------------------------------------------------------ #


# -[ antigen ]------------------------------------------------ #
# /
source ~/antigen.zsh

# - usings
antigen use oh-my-zsh

# - plugins
antigen bundle git
antigen bundle bgnotify
antigen bundle copybuffer
antigen bundle cp
antigen bundle history
antigen bundle gulp
antigen bundle elixir
antigen bundle jsontools
antigen bundle heroku
antigen bundle git-flow
antigen bundle command-not-found
antigen bundle nyan

antigen bundle   lukechilds/zsh-nvm
antigen bundle    zsh-users/zsh-completions
antigen bundle    zsh-users/zsh-history-substring-search
antigen bundle    zsh-users/zsh-syntax-highlighting
antigen bundle      unixorn/autoupdate-antigen.zshplugin
antigen bundle   ascii-soup/zsh-url-highlighter
antigen bundle      Valodim/zsh-curl-completion
antigen bundle      desyncr/auto-ls
antigen bundle     mafredri/zsh-async
antigen bundle     caarlos0/open-pr kind:path
antigen bundle       ninrod/pass-zsh-completion
antigen bundle     micrenda/zsh-nohup

# - theme
#antigen bundle sindresorhus/pure
antigen theme halfo/lambda-mod-zsh-theme

# - apply
antigen apply
# \
# -[ antigen ]------------------------------------------------ #


# -[ bindings ]----------------------------------------------- #
# /
# <Shift+Tab> :: reverse menu select.
bindkey -M menuselect '^[[Z' reverse-menu-complete

# \
# ------------------------------------------------------------ #


# -[ aliases ]------------------------------------------------ #
# /
gpr() {
    git push origin HEAD && git open-pr "$@"
}
# \
# ------------------------------------------------------------ #


# -[ completions ]-------------------------------------------- #
# /
zstyle ':completion:*' insert-tab false
# \
# ------------------------------------------------------------ #


# -[ other ]-------------------------------------------------- #
# /
# - PATH
#  bin                 -> user bin
#  .cargo/bin          -> rust
#  .kerl/scripts       -> erlang version manager
#  .kiex/scripts       -> elixir version manager
#  .kiex/elixirs/*.env -> elixir

source "$HOME/.kiex/scripts/kiex"
source "$(find $HOME/.kiex/elixirs/*.env -type f | sort | head -n 1)"

ERL_VERSION="$(basename $(find $HOME/.kerl/builds/* -type d | sort | head -n 1))"

export PATH=$HOME/bin\
:$HOME/.cargo/bin\
:$HOME/.kerl/scripts\
:$HOME/.kerl/installs/$ERL_VERSION/release_$ERL_VERSION/bin\
:$PATH

# - kerl
export KERL_DEFAULT_INSTALL_DIR=$HOME/.kerl/installs

# - fresh
emulate sh -c "`cat ~/.fresh/build/shell.sh | tail -n +2`"

# - vte (termite)
source /etc/profile.d/vte-*.sh

# - dotfile functions
compdef \
    '_arguments "1: :(zsh sxhkd fresh bspwm curl editor gem git polybar spacemacs)"' \
    conf
conf() {
    case $1 in
        zsh)       $EDITOR ~/.dotfiles/.zshrc ;;
        sxhkd)     $EDITOR ~/.dotfiles/.sxhkdrc;;
        fresh)     $EDITOR ~/.dotfiles/.freshrc;;
        bspwm)     $EDITOR ~/.dotfiles/.bspwmrc;;
        curl)      $EDITOR ~/.dotfiles/.curlrc;;
        editor)    $EDITOR ~/.dotfiles/.editorconfig;;
        gem)       $EDITOR ~/.dotfiles/.gemrc;;
        git)       $EDITOR ~/.dotfiles/.gitconfig;;
        polybar)   $EDITOR ~/.dotfiles/.polybar;;
        spacemacs) $EDITOR ~/.dotfiles/.spacemacs;;
        *)         $EDITOR ~/.dotfiles;;
    esac
}

# - proj functions
proj() {
    # TODO: more... - need to learn how to ls -d */ for zsh autocompletion.
    cd ~/projects
}

# \
# -[ other ]-------------------------------------------------- #

# -[ security ]----------------------------------------------- #
# /
# - ssh
eval $(keychain --eval github-god_rsa)

# - gpg
gpg-agent --daemon &> /dev/null
# \
# -[ security ]-------------------------------------------------- #
