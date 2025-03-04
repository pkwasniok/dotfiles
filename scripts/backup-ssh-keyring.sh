#!/bin/bash

KEYRING=$HOME/.config/ssh/keyring

if [ ! -e $KEYRING ]; then
    echo "=> Keyring does not exists!"
    exit 1
fi

for key in $KEYRING/*; do
    echo $key
done

