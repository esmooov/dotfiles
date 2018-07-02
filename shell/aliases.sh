#!/usr/bin/env bash

# - system
alias cls="clear" # :sad:

alias ls="exa --group-directories-first"
alias l="exa --long --group-directories-first --group --git"
alias la="exa --long --group-directories-first --all --group --git"
alias tree="exa -T"

alias c="xclip"
alias v="xclip -o"
alias cb="xclip -selection clipboard"

# - gpg
alias gpgls="gpg --list-secret-keys --keyid-format LONG"

# - emacs
# TODO: This doesn't work...
alias view="emacsclient --insert /dev/stdin"
alias EDITOR="~/bin/EDITOR"

# - web
alias internet="ping 8.8.8.8"
alias chrome="google-chrome"

# HTTP requests by @janmoesen
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	  alias "r-$method"="lwp-request -m '$method'"
done

# - git
# `cd` to git repository root
# Taken from: sapegin/dotfiles
alias groot='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'
