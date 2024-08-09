#!/bin/sh

# This script is used to propagate all configuration files
# from this repository across whole system.

# zsh
cp -r -f ./zsh/.zshrc ~/
echo 'Copied zsh configuration'

# kitty
cp -r -f ./kitty/* ~/.config/kitty/
echo 'Copied kitty configuration'

# neovim
cp -r -f ./nvim/* ~/.config/nvim/
echo 'Copied neovim configuration'

# sway
cp -r -f ./sway/* ~/.config/sway/
echo 'Copied sway configuration'

# waybar
cp -r -f ./waybar/* ~/.config/waybar/
echo 'Copied waybar configuration'

# mako
cp -r -f ./mako ~/.config/
echo 'Copied mako configuration'

# wofi
cp -r -f ./wofi ~/.config/
echo 'Copied wofi configuration'

# mercurial
cp -r -f ./hg ~/.config/
echo 'Copied mercurial configuration'

# fonts
cp -r -f ./fonts/* ~/.local/share/fonts/
echo 'Copied fonts'

