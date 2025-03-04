#!/bin/bash

CONFIG=$HOME/.config/ssh 
KEYRING=$CONFIG/keyring

mkdir -p $CONFIG
mkdir -p $KEYRING
ln -sf $CONFIG $HOME/.ssh

cp config $CONFIG

if [ ! -f $KEYRING/ssh-auth ]; then
    echo "=> Generating ssh authentication key"
    ssh-keygen -t ed25519 -f $KEYRING/ssh-auth
fi

if [ ! -f $KEYRING/git-sign ]; then
    echo "=> Generating git signing key"
    ssh-keygen -t ed25519 -f $KEYRING/git-sign
fi

