#!/bin/sh


function install_sway {
    mkdir -p ~/.config/sway
    cp -r sway/* ~/.config/sway

    echo "Installed sway configuration"
}

function install_waybar {
    mkdir -p ~/.config/waybar
    cp -r waybar/* ~/.config/waybar

    echo "Installed waybar configuration"
}

function install_wofi {
    mkdir -p ~/.config/wofi
    cp -r wofi/* ~/.config/wofi

    echo "Installed wofi configuration"
}

function install_mako {
    mkdir -p ~/.config/mako
    cp -r mako/* ~/.config/mako

    echo "Installed mako configuration"
}

function install_kitty {
    mkdir -p ~/.config/kitty
    cp -r kitty/* ~/.config/kitty

    echo "Installed kitty configuration"
}

function install_fish {
    mkdir -p ~/.config/fish
    cp -r fish/* ~/.config/fish

    echo "Installed fish configuration"
}

function install_neovim {
    mkdir -p ~/.config/nvim
    cp -r nvim/* ~/.config/nvim

    echo "Installed neovim configuration"
}

function install_git {
    mkdir -p ~/.config/git
    cp -r git/* ~/.config/git

    echo "Installed git configuration"
}

function install_fonts {
    mkdir -p ~/.local/share/fonts
    cp -r fonts/* ~/.local/share/fonts

    echo "Installed fonts configuration"
}

function install_steam {
    mkdir -p ~/.local/share/steam
    flatpak override com.valvesoftware.Steam --filesystem="~/.local/share/steam"

    echo "Installed steam configuration"
}

function install_ssh_keys {
    cat crypto/ssh/workstation.pub > ~/.ssh/authorized_keys
    cat crypto/ssh/laptop.pub >> ~/.ssh/authorized_keys
    cat crypto/ssh/mainframe.pub >> ~/.ssh/authorized_keys
    cat crypto/ssh/phone.pub >> ~/.ssh/authorized_keys

    echo "Installed ssh-keys configuration"
}



function install_preset_workstation {
    install_sway
    install_waybar
    install_wofi
    install_mako
    install_kitty
    install_fish
    install_neovim
    install_git
    install_fonts
    install_steam
}



if [ $1 == "install-preset" ] && [ $2 == "workstation" ]; then
    install_preset_workstation
elif [ $1 == "install" ] && [ $2 == "ssh-keys" ]; then
    install_ssh_keys
fi

