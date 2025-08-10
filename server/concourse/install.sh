CONFIG=$HOME/.config/concourse
DATA=$HOME/.local/share/concourse

mkdir -p $CONFIG
mkdir -p $DATA

cp docker-compose.yaml $CONFIG

mkdir -p $DATA/keys
ssh-keygen -t rsa -b 4096 -m PEM -N "" -f $DATA/keys/session
ssh-keygen -t rsa -b 4096 -m PEM -N "" -f $DATA/keys/host
ssh-keygen -t rsa -b 4096 -m PEM -N "" -f $DATA/keys/worker

sudo cp concourse.service /etc/systemd/system
sudo chown root:root /etc/systemd/system/concourse.service

