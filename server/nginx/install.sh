CONFIG=$HOME/.config/nginx

mkdir -p $CONFIG

cp docker-compose.yaml $CONFIG
cp nginx.conf $CONFIG

sudo cp nginx.service /etc/systemd/system/

