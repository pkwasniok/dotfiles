# 1. Install system packages
# echo "=> Installing system packages"
# pacstarp -K /mnt base linux linux-firmware sof-firmware networkmanager bluez amd-ucode \
#                  sudo efibootmgr btrfs-progs bluez-utils \
#                  man-db man-pages neovim tmux fish curl \
#                  base-devel git gdb make \
#                  docker flatpak \
#                  pipewire pipewire-audio pipewire-alsa pipewire-pulse wireplumber \
#                  sway swaybg waybar mako wofi wl-clipboard gnu-free-fonts \
#                  xdg-desktop-portal xdg-desktop-portal-wlr \
#                  kitty firefox minicom github-cli

# 2. Generate fstab
# echo "=> Generating fstab"
# genfstab -U /mnt >> /mnt/etc/fstab

# 3. Change root
# echo "=> Changing root"
# arch-chroot /mnt

# 4. Configure boot entries
echo "=> Configuring boot entries"
echo "ALL_kver=\"/boot/vmlinuz-linux\"" > /etc/mkinitcpio.d/linux.preset
echo "PRESETS=(\'default\', \'fallback\')" >> /etc/mkinitcpio.d/linux.preset
echo "default_uki=\"esp/EFI/Linux/arch-linux.efi\"" >> /etc/mkinitcpio.d/linux.preset
echo "default_options=\"--splash=/usr/share/systemd/bootctl/splash-arch.bmp\"" >> /etc/mkinitcpio.d/linux.preset
echo "fallback_uki=\"esp/EFI/Linux/arch-linux-fallback.efi\"" >> /etc/mkinitcpio.d/linux.preset
echo "fallback_options=\"-S autodetect\"" >> /etc/mkinitcpio.d/linux.preset

# 5. Generate boot entries
mkinitcpio -p linux

# 5. Register boot entries
echo "=> Registering boot entries"
efibootmgr --create --unicode --disk /dev/nvme0n1 \
           --label "Arch Linux" \
           --loader "\\EFI\\Linux\\arch-linux.efi"
efibootmgr --create --unicode --disk /dev/nvme0n1 \
           --label "Arch Linux (fallback)" \
           --loader "\\EFI\\Linux\\arch-linux-fallback.efi"

