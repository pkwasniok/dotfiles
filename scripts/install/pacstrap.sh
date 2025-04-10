# 1. Install system packages
echo "=> Installing system packages"
pacstarp -K /mnt base linux linux-lts linux-firmware sof-firmware networkmanager bluez amd-ucode edk2-shell \
                 sudo efibootmgr btrfs-progs bluez-utils pacman-contrib reflector \
                 man-db man-pages neovim tmux fish curl htop rsync ripgrep \
                 base-devel openssh git gdb make \
                 bzip2 bzip3 gzip xz zstd 7zip tar zip unzip \
                 docker flatpak \
                 pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack wireplumber \
                 sway swaybg waybar mako wofi wl-clipboard grim slurp libnotify noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji ttf-font-awesome \
                 xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
                 kitty firefox minicom github-cli \
                 tlp iptables \
                 octave

