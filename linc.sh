read -p 'Enter your masternode genkey you created in windows, then hit [ENTER]: ' GENKEY
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install nano htop git
sudo apt-get -y install software-properties-common
sudo apt-get -y install build-essential libtool autotools-dev pkg-config libssl-dev
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install libevent-dev
sudo apt-get -y install libminiupnpc-dev
sudo apt-get -y install autoconf
sudo apt-get -y install automake
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get -y update
sudo apt-get -y install libdb4.8-dev libdb4.8++-dev
sudo apt-get -y install libzmq3-dev
sudo apt-get -y install unzip


mkdir linc
cd linc
wget https://github.com/LINCPlatform/LINC/releases/download/0.12.1.5-hf-70210/LINC_v0.12.1.5_hf_70210_linux.tar.gz

tar -xvf LINC_v0.12.1.5_hf_70210_linux.tar.gz
rm LINC_v0.12.1.5_hf_70210_linux.tar.gz




mkdir -p ~/.linc
cat <<EOT >> ~/.linc/linc.conf
rpcuser=mn1
rpcpassword=pOyOjhgRdghb34rvweFJ6
externalip={IP}:17222
masternode=1
masternodeprivkey={PK}
daemon=1
addnode=45.77.182.60
addnode=172.98.197.243
addnode=221.162.18.164
addnode=173.199.118.148
EOT
IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
sed -i -e "s/{IP}/$IP/g" ~/.linc/linc.conf

sed -i -e "s/{PK}/$GENKEY/g" ~/.linc/linc.conf

~/linc/lincd
