#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Get user and group of a file. "
    echo "                              "
    echo "Usage:                        "
    echo "  perm.sh /path/to/file       "
    exit 1
fi

stat -c "%U %G" $1
