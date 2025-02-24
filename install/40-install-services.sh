# 1. Enable networkmanage
echo "=> Enabling NetworkManager"
systemctl enable --now NetworkManager.service

# 2. Enable systemd-timesyncd
echo "=> Enabling systemd-timesyncd"
systemctl enable --now systemd-timesyncd.service

# 3. Enable docker
echo "=> Enabling docker"
systemctl enable --now docker.service

