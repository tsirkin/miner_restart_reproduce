#!/usr/bin/env sh

DATADIR=/root/files/datadir

INIT_DONE=${DATADIR}/init_done


if [ ! -f ${INIT_DONE} ]; then

  rm -rf ${DATADIR:?}/*

  geth --datadir="${DATADIR}" init /root/files/genesis.json
  touch ${INIT_DONE}

fi
exec geth \
  --datadir="${DATADIR}" \
  --allow-insecure-unlock \
  --http \
  --http.addr="0.0.0.0" \
  --http.api="eth,web3,net,admin,personal,txpool,miner,clique" \
  --http.corsdomain="*" \
  --keystore=/root/files/keystore \
  --networkid="${NETWORK_ID}" \
  --syncmode 'full' \
  --snapshot=false \
  --http.vhosts=*


# --preload "mineWhenNeeded.js"