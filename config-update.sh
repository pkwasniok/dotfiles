#!/bin/sh

# ==== Desktop environment ====

# Sway
mkdir -p ~/.config/sway
cp -r sway/* ~/.config/sway

# Waybar
mkdir -p ~/.config/waybar
cp -r waybar/* ~/.config/waybar

# Wofi (launcher)
mkdir -p ~/.config/wofi
cp -r wofi/* ~/.config/wofi

# Mako (notification daemon)
mkdir -p ~/.config/mako
cp -r mako/* ~/.config/mako

# Kitty (terminal emulator)
mkdir -p ~/.config/kitty
cp -r kitty/* ~/.config/kitty

# ==== System tools ====

# Fish
mkdir -p ~/.config/fish
cp -r fish/* ~/.config/fish

# ==== Development tools ====

# Neovim
mkdir -p ~/.config/nvim
cp -r nvim/* ~/.config/nvim

# Git
mkdir -p ~/.config/git
cp -r git/* ~/.config/git

# ==== Other ====

# Fonts
mkdir -p ~/.local/share/fonts
cp -r fonts/* ~/.local/share/fonts

