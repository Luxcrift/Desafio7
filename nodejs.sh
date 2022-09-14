#!/bin/bash
read -p “introduce la url del repositorio a clonar: ” repo
git clone $repo


sudo apt install nodejs npm
echo " instalando nodejs npm"

curl -sL https://deb.nodesource.com/setup_14.x -o node_setup.sh


sudo bash node_setup.sh

sudo apt install gcc g++ make -y
echo "instalando gcc "

sudo apt install -y nodejs

sudo adduser nodejs
echo "agregado el user de nodejs"


##node challenge-linux-bash/server.js

sudo touch /lib/systemd/system/devops@.service
sudo cat > /lib/systemd/system/devops@.service <<EOF
[Unit]
Description=Balanceo para desafio Final
Documentation=https://github.com/roxsross/challenge-linux-bash
After=network.target

[Service]
Enviroment=PORT=%i
Type=simple
User=nodejs
WorkingDirectory=/home/ubuntu/challenge-linux-bash
ExecStart=/usr/bin/node /home/ubuntu/challenge-linux-bash/server.js
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
