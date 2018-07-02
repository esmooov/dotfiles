#!/usr/bin/env bash

# -[ env ] --------------------------------------------------- #
# /
export GITHUB_USER=nate-wilkins
export EDITOR=~/bin/EDITOR
export SUDO_EDITOR=~/bin/EDITOR

# -[ path ] -------------------------------------------------- #
# /
path_add() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    fi
}

path_add "/usr/local/sbin"
