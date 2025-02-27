# 1. Generate locale
echo "=> Generating locale"
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "pl_PL.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# 2. Configure locale
echo "=> Configuring locale"
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "LC_TIME=pl_PL.UTF-8" >> /etc/locale.conf

# 3. Configure keymap
echo "=> Configuring keymap"
echo "KEYMAP=pl" > /etc/vconsole.conf

# 4. Configure timezone
echo "=> Configuring timezone"
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc

