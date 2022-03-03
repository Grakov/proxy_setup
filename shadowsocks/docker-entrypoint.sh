#!/bin/bash

ufw deny 9000
ufw allow 80
ufw allow 443

nginx

certbot --non-interactive --agree-tos \
-m admin@example.com \
--no-redirect \
--email 'admin@example.com' \
--installer nginx \
--domains "example.com"

./wait-for-it.sh -t 0 127.0.0.1:443 -- echo "Certbot done"
/usr/bin/ssserver --log-without-time -c /etc/shadowsocks-rust/config.json

