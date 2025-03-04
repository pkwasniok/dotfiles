#!/bin/bash

CONFIG=$HOME/.config/fish

mkdir -p $CONFIG
mkdir -p $CONFIG/functions

cp config.fish $CONFIG
cp prompt.fish $CONFIG/functions/fish_prompt.fish

