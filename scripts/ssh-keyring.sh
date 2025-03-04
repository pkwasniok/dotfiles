#!/bin/bash

KEYRING=$HOME/.config/ssh/keyring

if [ ! -e $KEYRING ]; then
    mkdir -p $KEYRING
fi

help() {
    echo "Options:"
    echo "--help, -h        Display this help message."
    echo "--export, -e      Export keyring."
    echo "--list, -l        List keyring public keys."
}

export() {
    tar -caf keyring.tar.gz -C $KEYRING .
}

list() {
    for pubkey in $KEYRING/*.pub; do
        echo "$(basename $pubkey .pub) \"$(cat $pubkey)\""
    done
}

if [ $# = 0 ]; then
    list
    exit 0
fi

if [ $1 = '--help' ] || [ $1 = '-h' ]; then
    help
elif [ $1 = '--export' ] || [ $1 = '-e' ]; then
    export
elif [ $1 = '--list' ] || [ $1 = '-l' ]; then
    list
fi

