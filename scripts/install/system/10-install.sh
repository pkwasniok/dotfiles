echo "=> Configuring boot entries"
echo "ALL_kver=\"/boot/vmlinuz-linux\"" > /etc/mkinitcpio.d/linux.preset
echo "PRESETS=('default' 'fallback')" >> /etc/mkinitcpio.d/linux.preset
echo "default_uki=\"/boot/EFI/Linux/arch-linux.efi\"" >> /etc/mkinitcpio.d/linux.preset
echo "default_options=\"--splash=/usr/share/systemd/bootctl/splash-arch.bmp\"" >> /etc/mkinitcpio.d/linux.preset
echo "fallback_uki=\"/boot/EFI/Linux/arch-linux-fallback.efi\"" >> /etc/mkinitcpio.d/linux.preset
echo "fallback_options=\"-S autodetect\"" >> /etc/mkinitcpio.d/linux.preset

echo "=> Generating boot entries"
mkinitcpio -p linux
cp /usr/share/edk2-shell/x64/Shell_Full.efi /boot/shellx64.efi

echo "=> Registering boot entries"
efibootmgr --create --index 0 --unicode --disk /dev/nvme0n1 \
           --label "Arch Linux" \
           --loader "\\EFI\\Linux\\arch-linux.efi"
efibootmgr --create --index 1 --unicode --disk /dev/nvme0n1 \
           --label "Arch Linux (fallback)" \
           --loader "\\EFI\\Linux\\arch-linux-fallback.efi"
efibootmgr --create --index 2 --unicode --disk /dev/nvme0n1 \
           --label "UEFI SHELL" \
           --loader "\\shellx64.efi"

