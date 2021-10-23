#!/bin/bash

read -p "Your bitcountry node name: " BITC_NODE
echo 'export BITC_NODE="'${BITC_NODE}' | MMS"' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo "[Unit]
Description=Bit.Country Node
After=network.target
[Service]
User=root
WorkingDirectory=$HOME
ExecStart=$HOME/Bit-Country-Blockchain/target/release/bitcountry-node --chain tewai --validator --name '${BITC_NODE}' --bootnodes /ip4/13.239.118.231/tcp/30344/p2p/12D3KooW9rDqyS5S5F6oGHYsmFjSdZdX6HAbTD88rPfxYfoXJdNU --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' --pruning archive
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/bitcountryd.service

sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF

sudo systemctl restart systemd-journald
sudo systemctl daemon-reload

sudo systemctl enable bitcountryd
sudo systemctl restart bitcountryd

sleep 3

systemctl status bitcountryd
