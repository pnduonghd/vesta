#!/bin/bash
export PATH=$PATH:/sbin
echo "Nhap user muon install : "
read user
echo "Nhap port redis : "
read port
mkdir -p /home/$user/redis
sed -e "s;%PORT%;$port;g" -e "s;%USER%;$user;g" redis.conf > /home/$user/redis/redis.conf
sed -e "s;%PORT%;$port;g" -e "s;%USER%;$user;g" redis-shutdown > /home/$user/redis/redis-shutdown
sed -e "s;%PORT%;$port;g" -e "s;%USER%;$user;g" redis.service > /usr/lib/systemd/system/redis-$user.service
chown -R $user.$user /home/$user/redis
systemctl enable redis-$user
systemctl daemon-reload
systemctl start redis-$user
