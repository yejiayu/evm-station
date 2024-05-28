#!/bin/bash

CHAINID="${CHAIN_ID:-aircaiks_9000-1}"
MONIKER="localtestnet"
# Remember to change to other types of keyring like 'file' in-case exposing to outside world,
# otherwise your balance will be wiped quickly
# The keyring test does not require private key to steal tokens from you
KEYRING="test"
KEYALGO="eth_secp256k1"
LOGLEVEL="info"
# Set dedicated home directory for the evmosd instance
HOMEDIR="$HOME/.evmosd"
# to trace evm
#TRACE="--trace"
TRACE=""

# feemarket params basefee
BASEFEE=1000000000

# Path variables
CONFIG=$HOMEDIR/config/config.toml
APP_TOML=$HOMEDIR/config/app.toml
GENESIS=$HOMEDIR/config/genesis.json
TMP_GENESIS=$HOMEDIR/config/tmp_genesis.json


./build/station-evm start \
	--metrics "$TRACE" \
	--log_level $LOGLEVEL \
	--minimum-gas-prices=0.0001aevmos \
	--json-rpc.api eth,txpool,personal,net,debug,web3 \
	--home "$HOMEDIR" \
	--chain-id "$CHAINID"