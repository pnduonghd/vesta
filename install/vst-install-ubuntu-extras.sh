#!/bin/bash

apt install -y build-essential
apt install -y php-dev libpcre3-dev gcc make
apt install -y redis wget python3 python3-dev nload htop nano
apt install -y php-redis php-gmp php-bcmath

echo Install Phalcon
cd /root
git clone https://github.com/phalcon/cphalcon --depth=1 -b 3.4.x
cd cphalcon/build
./install

echo extension=phalcon.so > /etc/php/7.2/fpm/conf.d/30-phalcon.ini
echo extension=phalcon.so > /etc/php/7.2/cli/conf.d/30-phalcon.ini

cd /root
rm -rf /root/cphalcon

echo Install Phalcon Devtools
git clone git://github.com/phalcon/phalcon-devtools.git --depth=1 -b 3.4.x /opt/phalcon
ln -s /opt/phalcon/phalcon /usr/local/bin/phalcon
chmod ugo+x /usr/local/bin/phalcon
phalcon

echo Install NodeJS
curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
apt install -y gcc g++ make git libssl-dev
apt install -y nodejs
npm i -g pm2

apt clean

echo 'Redis'
service redis-server start
redis-cli ping
php -r "new Redis();"

echo 'PHP'
php -v

echo 'NGINX'
nginx -v

echo 'Python3'
python3 -V

echo 'NodeJS'
node -v
npm -v

echo 'Phalcon'
php -r "echo Phalcon\Version::get();"
echo
cd ~
cat .my.cnf
