# 1. Install system packages
echo "=> Installing system packages"
pacstarp -K /mnt base linux linux-firmware sof-firmware networkmanager bluez amd-ucode edk2-shell \
                 sudo efibootmgr btrfs-progs bluez-utils \
                 man-db man-pages neovim tmux fish curl htop rsync \
                 base-devel openssh git gdb make \
                 docker flatpak \
                 pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack wireplumber \
                 sway swaybg waybar mako wofi wl-clipboard noto-fonts ttf-font-awesome \
                 xdg-desktop-portal xdg-desktop-portal-wlr \
                 kitty firefox minicom github-cli \
                 tlp

