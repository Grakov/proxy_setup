#!/bin/bash

if ! [ -x "$(whereis certbot | cut -d' ' -f2)" ]; then
  service snapd start
  snap install core
  snap refresh core
  snap install --classic certbot
  ln -s /snap/bin/certbot /usr/bin/certbot
fi

nginx

certbot --non-interactive --agree-tos \
-m admin@example.com \
--no-redirect \
--email 'admin@example.com' \
--installer nginx \
--domains "example.com"

./wait-for-it.sh -t 0 127.0.0.1:443 -- echo "Certbot done"
/usr/bin/ssserver --log-without-time -c /etc/shadowsocks-rust/config.json

