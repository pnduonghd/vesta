#!/bin/bash
export PATH=$PATH:/sbin
echo "Nhap user muon install : "
read user
echo "Nhap port:"
read port
echo "Nhap RPCport:"
read rpc_port
echo "Nhap IP Source:"
read ip_source

CONTINUTEPROCESS=0
if lsof -Pi :${port} -sTCP:LISTEN -t >/dev/null ; then
    echo "PORT" ${port} "running"
    let CONTINUTEPROCESS=0
else
    let CONTINUTEPROCESS=1
fi

if lsof -Pi :${rpc_port} -sTCP:LISTEN -t >/dev/null ; then
    echo "RPCPORT" ${rpc_port} "running"
    let CONTINUTEPROCESS=0
else
    let CONTINUTEPROCESS=1
fi




if [ $CONTINUTEPROCESS -eq 1 ]
then
walletPath=/home/$user/btc
mkdir -p ${walletPath}
chown -R ${user}.${user} ${walletPath}
mkdir -p /root/.bitcoin_${user}

bitcoin-cli stop
echo "Wating for stop Main node to copy blockchain 20s"
sleep 20
echo "Coping blockchain"
cp -r -v /root/.bitcoin/* /root/.bitcoin_${user}
bitcoind
rm -rf /root/.bitcoin_${user}/bitcoin.conf
rm -rf /root/.bitcoin_${user}/wallet.dat

RPCUSER=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
RPCPASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
cat <<EOF > /root/.bitcoin_${user}/bitcoin.conf
daemon=1
server=1
listen=1
rpcuser=${RPCUSER}
rpcpassword=${RPCPASSWORD}
rpcport=${rpc_port}
port=${port}
rpcallowip=${ip_source}
prune=1024
wallet=${walletPath}
EOF

bitcoind -datadir=/root/.bitcoin_${user}/
/usr/local/vesta/bin/v-add-firewall-rule accept ${ip_source} ${rpc_port} TCP BTC_${user}
echo "------------"
echo "RPCUSER: ${RPCUSER}"
echo "RPCPASSWORD: ${RPCPASSWORD}"
echo "RPCPORT: ${rpc_port}"
echo "bitcoind -datadir=/root/.bitcoin_${user}/"
echo "bitcoin-cli -datadir=/root/.bitcoin_${user}/ stop"
echo "bitcoin-cli -datadir=/root/.bitcoin_${user}/ getblockchaininfo"
NEW_UUID_MORE_CHARACTERS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo "bitcoin-cli -datadir=/root/.bitcoin_fioption/ encryptwallet ${NEW_UUID_MORE_CHARACTERS}"
else
    echo "KHONG KHOI TAO DUOC INSTANCE"
fi
