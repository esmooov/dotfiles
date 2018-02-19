#!/usr/bin/env bash

# -[ env variables ] ----------------------------------------- #
# /
export GITHUB_USER=nate-wilkins


# -[ path ] -------------------------------------------------- #
# /
path_add() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    fi
}

path_add "/usr/local/sbin"
