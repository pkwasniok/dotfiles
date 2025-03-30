#!/bin/bash

CONFIG=$HOME/.config/waybar

mkdir -p $CONFIG

cp config $CONFIG/config
cp style.css $CONFIG/style.css

