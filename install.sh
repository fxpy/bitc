#!/bin/bash

sudo apt update
sudo apt install -y cmake make clang pkg-config libssl-dev build-essential git jq libclang-dev clang curl libz-dev jq

curl https://sh.rustup.rs -sSf | sh -s -- -y

source $HOME/.cargo/env

rustup default stable

#rustup update nightly-2021-07-02
#rustup update stable
#rustup target add wasm32-unknown-unknown --toolchain nightly-2021-07-02
#WASM_BUILD_TOOLCHAIN=nightly-2021-07-02 cargo build --release
rustup update
#rustup update nightly
#rustup target add wasm32-unknown-unknown --toolchain nightly
#rustup default nightly-2021-07-02


#cd $HOME
#git clone https://github.com/bit-country/Bit-Country-Blockchain.git
#cd Bit-Country-Blockchain
#git checkout 11f2b0ec216c7ce30008ec5a233cfe6baef8160d
#git pull origin master
#git checkout bfece87795f3b4bd4be225989af2ed717fbf9f8c
#./scripts/init.sh
#cargo build --release --features=with-bitcountry-runtime
