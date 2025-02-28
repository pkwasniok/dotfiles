# 1. Enable networkmanage
echo "=> Enabling NetworkManager"
systemctl enable --now NetworkManager.service

# 2. Enable systemd-timesyncd
echo "=> Enabling systemd-timesyncd"
systemctl enable --now systemd-timesyncd.service

# 3. Enable docker
echo "=> Enabling docker"
systemctl enable --now docker.service

# 4. Enable bluetooth
echo "=> Enabling bluetooth"
systemctl enable --now bluetooth.service

# 5. Enable paccache.timer
echo "=> Enabling weekly pacman cache clean-up"
systemctl enable --now paccache.timer

