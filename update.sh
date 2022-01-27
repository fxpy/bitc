#!/bin/bash

sudo apt update
sudo apt upgrade -y

systemctl stop bitcountryd.service
systemctl stop metaversed.service

mv $HOME/Bit-Country-Blockchain/target/release/bitcountry-node $HOME/Bit-Country-Blockchain/target/release/bitcountry-node.oldest
mv $HOME/Bit-Country-Blockchain/target/release/metaverse-node $HOME/Bit-Country-Blockchain/target/release/metaverse-node.old
mv $HOME/Metaverse-Network/target/release/metaverse-node $HOME/Metaverse-Network/target/release/metaverse-node.old

wget -O $HOME/Metaverse-Network/target/release/metaverse-node https://github.com/bit-country/Metaverse-Network/releases/download/tewai-release-277/metaverse-node-tewai-v0.0.2
wget -O $HOME/Bit-Country-Blockchain/target/release/bitcountry-node https://github.com/bit-country/Metaverse-Network/releases/download/tewai-release-277/metaverse-node-tewai-v0.0.2

chmod +x $HOME/Metaverse-Network/target/release/metaverse-node
chmod +x $HOME/Bit-Country-Blockchain/target/release/bitcountry-node

systemctl restart bitcountryd.service
systemctl restart metaversed.service

systemctl status metaversed.service
systemctl status bitcountryd.service
