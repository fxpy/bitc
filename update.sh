#!/bin/bash

systemctl stop bitcountryd.service

mv /$HOME/Bit-Country-Blockchain/target/release/bitcountry-node /$HOME/Bit-Country-Blockchain/target/release/bitcountry-node.old 
wget -O /$HOME/Bit-Country-Blockchain/target/release/bitcountry-node https://github.com/bit-country/Metaverse-Network/releases/download/v0.0.1/metaverse-node
chmod +x /$HOME/Bit-Country-Blockchain/target/release/bitcountry-node

systemctl restart bitcountryd
