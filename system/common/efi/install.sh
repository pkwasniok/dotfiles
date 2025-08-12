cp /usr/share/edk2-shell/x64/Shell_Full.efi /boot/shellx64.efi

efibootmgr --create --index 0 --unicode --disk /dev/nvme0n1 \
           --label "Arch Linux" \
           --loader "\\EFI\\Linux\\arch-linux.efi"

efibootmgr --create --index 1 --unicode --disk /dev/nvme0n1 \
           --label "Arch Linux (fallback)" \
           --loader "\\EFI\\Linux\\arch-linux-fallback.efi"

efibootmgr --create --index 2 --unicode --disk /dev/nvme0n1 \
           --label "UEFI SHELL" \
           --loader "\\shellx64.efi"

efibootmgr --remove-dups

