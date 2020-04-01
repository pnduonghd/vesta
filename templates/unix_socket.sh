#!/bin/bash

user=$1
domain=$2
ip=$3
home=$4
docroot=$5

mkdir -p "$home/$user/web/$domain/app"

chown -R $user:$user "$home/$user/web/$domain/app"
