#!/bin/bash

nginx

certbot -n --agree-tos \
-m admin@example.com \
--no-redirect \
--email 'admin@example.com' \
--nginx \
--domains "example.com"

./wait-for-it.sh -t 0 127.0.0.1:443 -- echo "Certbot done"
/usr/bin/ssserver --log-without-time -c /etc/shadowsocks-rust/config.json

