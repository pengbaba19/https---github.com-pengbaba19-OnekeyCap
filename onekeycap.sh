#服务器：
#操作系统ubuntu16.04
#执行脚本
read -p 'Enter your masternode genkey you created in windows, then hit [ENTER]: ' GENKEY
sudo apt-get -y update

sudo apt-get -y upgrade



sudo apt-get -y install software-properties-common

sudo apt-add-repository -y ppa:bitcoin/bitcoin

sudo apt-get -y update

sudo apt-get -y install wget git unzip libevent-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libzmq3-dev nano


sudo apt-get install vim

sudo apt-get -y update

sudo apt-get -y upgrade

sudo apt-get -y install libdb4.8-dev

sudo apt-get -y install libdb4.8++-dev

sudo wget https://github.com/Cap-Project/CapitalCoin/releases/download/v1.0.0/cap-1.0.0-x86_64-linux-gnu.tar.gz

sudo tar -xvf cap-1.0.0-x86_64-linux-gnu.tar.gz

sudo rm cap-1.0.0-x86_64-linux-gnu.tar.gz




mkdir -p ~/.CapitalCoin
cat <<EOT >> ~/.CapitalCoin/cap.conf
rpcuser=213124
rpcpassword=sfejlgjlkeafuieu&lsjie!KJLL(
rpcallowip=127.0.0.1
listen=1
server=1
daemon=1
logtimestamps=1
maxconnections=256
masternode=1
externalip={IP}
bind={IP}:9491
masternodeaddr={IP}
masternodeprivkey={PK}
EOT
IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
sed -i -e "s/{IP}/$IP/g"  ~/.CapitalCoin/cap.conf

sed -i -e "s/{PK}/$GENKEY/g"  ~/.CapitalCoin/cap.conf


 ~/cap-1.0.0/bin/capd





