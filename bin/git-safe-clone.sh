#!/bin/sh

REPOSRC=$1
LOCALREPO=$2
LOCALREPO_VC_DIR=$LOCALREPO/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone $REPOSRC $LOCALREPO
else
    pushd $LOCALREPO
    git pull $REPOSRC
    popd
fi
