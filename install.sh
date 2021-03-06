#!/bin/bash

read -p "Your bitcountry node name: " BITC_NODE
echo 'export BITC_NODE="'${BITC_NODE}' | MMS"' >> $HOME/.bash_profile
. $HOME/.bash_profile

sudo apt update
sudo apt install -y cmake make clang pkg-config libssl-dev build-essential git jq libclang-dev clang curl libz-dev jq

curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustup update nightly-2022-01-10
rustup update stable

git clone https://github.com/bit-country/Metaverse-Network.git
cd Metaverse-Network
git pull origin release-0.0.3
git checkout 74757f8348e11214e69ef7a0c2395fe266021013
rustup target add wasm32-unknown-unknown --toolchain nightly-2022-01-10
rustup update nightly-2022-01-10
rustup default nightly-2022-01-10

cargo build --release --features=with-tewai-runtime

echo "[Unit]
Description=Bit.Country Node
After=network.target
[Service]
User=root
WorkingDirectory=$HOME
ExecStart=$HOME/Metaverse-Network/target/release/metaverse-node --chain tewai --validator --name '${BITC_NODE}' --bootnodes /ip4/13.239.118.231/tcp/30344/p2p/12D3KooW9rDqyS5S5F6oGHYsmFjSdZdX6HAbTD88rPfxYfoXJdNU --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' --pruning archive
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
