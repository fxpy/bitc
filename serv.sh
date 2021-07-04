echo "[Unit]
Description=Bit.Country Node
After=network.target
[Service]
User=root
WorkingDirectory=$HOME
ExecStart=$HOME/Bit-Country-Blockchain/target/release/bitcountry-node --chain tewai --validator --name 'terros | MMS' --bootnodes /ip4/13.239.118.231/tcp/30344/p2p/12D3KooW9rDqyS5S5F6oGHYsmFjSdZdX6HAbTD88rPfxYfoXJdNU --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' --pruning archive
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
" > $HOME/bitcountryd.service
sudo mv $HOME/bitcountryd.service /etc/systemd/system
sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF
sudo systemctl restart systemd-journald
sudo systemctl daemon-reload

sudo systemctl enable bitcountryd
sudo systemctl restart bitcountryd
