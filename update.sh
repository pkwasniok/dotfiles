#!/bin/sh

# This script is used to propagate all configuration files
# from this repository across whole system.

# pacman
cp pacman/pacman.conf /etc/pacman.conf
echo '--> Copied pacman configuration'

# fish
cp -r -f ./fish/* ~/.config/fish/
echo '--> Copied fish configuration'

# kitty
cp -r -f ./kitty/* ~/.config/kitty/
echo '--> Copied kitty configuration'

# neovim
cp -r -f ./nvim/* ~/.config/nvim/
echo '--> Copied neovim configuration'

# sway
cp -r -f ./sway/* ~/.config/sway/
echo '--> Copied sway configuration'

# waybar
cp -r -f ./waybar/* ~/.config/waybar/
echo '--> Copied waybar configuration'

# mako
cp -r -f ./mako ~/.config/
echo '--> Copied mako configuration'

# wofi
cp -r -f ./wofi ~/.config/
echo '--> Copied wofi configuration'

# mercurial
cp -r -f ./hg ~/.config/
echo '--> Copied mercurial configuration'

# git
cp -r -f ./git ~/.config/
echo '--> Copied git configuration'

# gpg
cp -r -f ./gpg/* ~/.gnupg/
echo '--> Copied gpg configuration'

# fonts
cp -r -f ./fonts/* ~/.local/share/fonts/
echo '--> Copied fonts'

