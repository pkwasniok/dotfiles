#!/bin/bash

CONFIG=$HOME/.config/sway

mkdir -p $CONFIG
cp config $CONFIG/config
cp theme $CONFIG/theme
cp -r wallpapers $CONFIG

