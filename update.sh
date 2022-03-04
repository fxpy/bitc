#!/bin/bash

sudo apt update
sudo apt upgrade -y

systemctl stop bitcountryd.service

mv $HOME/Bit-Country-Blockchain/target/release/bitcountry-node $HOME/Bit-Country-Blockchain/target/release/bitcountry-node.oldest
mv $HOME/Bit-Country-Blockchain/target/release/metaverse-node $HOME/Bit-Country-Blockchain/target/release/metaverse-node.oldest
mv $HOME/Metaverse-Network/target/release/metaverse-node $HOME/Metaverse-Network/target/release/metaverse-node.old

wget -O $HOME/Metaverse-Network/target/release/metaverse-node https://github.com/fxpy/bitc/releases/download/v0.0.3/metaverse-node-0.0.3
wget -O $HOME/Bit-Country-Blockchain/target/release/bitcountry-node https://github.com/fxpy/bitc/releases/download/v0.0.3/metaverse-node-0.0.3

chmod +x $HOME/Metaverse-Network/target/release/metaverse-node
chmod +x $HOME/Bit-Country-Blockchain/target/release/bitcountry-node

systemctl restart bitcountryd.service
systemctl status bitcountryd.service
