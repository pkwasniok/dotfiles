cp playerctl.service /etc/systemd/user/playerctl.service
cp swayidle.service /etc/systemd/user/swayidle.service

systemctl enable --now NetworkManager.service

systemctl enable --now bluetooth.service

systemctl enable --now reflector.timer

systemctl enable --now paccache.timer

systemctl enable --now systemd-timesyncd.service

systemctl enable --now iptables.service

systemctl enable --now docker.service

systemctl enable --now cups.service

