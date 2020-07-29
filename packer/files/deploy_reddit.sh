#!/bin/bash

OWNER="appuser"
OWNER_HOME="/home/$OWNER"
APP_DIR="$OWNER_HOME/app"

apt-get install -y git
useradd -U -d $OWNER_HOME -s /bin/bash $OWNER
sudo git clone -b monolith https://github.com/express42/reddit.git $APP_DIR
chown -R $OWNER:$OWNER $APP_DIR
cd $OWNER_HOME && bundle install

echo "[Unit]
Description=Puma HTTP Server
After=network.target
Requires=mongod.service
[Service]
Type=simple
User=$OWNER
Group=$OWNER
WorkingDirectory=$APP_DIR
ExecStart=/usr/local/bin/puma
Restart=always
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/puma.service

systemctl enable puma.service
systemctl start puma.service