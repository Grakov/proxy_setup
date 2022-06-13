#!/bin/bash

nginx

certbot -n --agree-tos \
-m admin@example.com \
--no-redirect \
--email 'admin@example.com' \
--nginx \
--domains "example.com"

crontask=$(cat /etc/crontab | grep 'certbot renew')
if [[ -z "$crontask" ]]; then
  SLEEPTIME=$(awk 'BEGIN{srand(); print int(rand()*(3600+1))}')
  echo "0 0,12 * * * root sleep $SLEEPTIME && certbot renew -q" | tee -a /etc/crontab > /dev/null
fi

./wait-for-it.sh -t 0 127.0.0.1:443 -- echo "Certbot done"
/usr/bin/ssserver --log-without-time -c /etc/shadowsocks-rust/config.json

