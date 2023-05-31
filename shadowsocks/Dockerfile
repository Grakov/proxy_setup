FROM teddysun/shadowsocks-rust:debian-1.15.3

EXPOSE 80
EXPOSE 443

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get install -y \
    nginx-full \
    systemd \
    curl \
    python3 \
    python-is-python3 \
    python3-pip \
    libaugeas0 \
    cron \
    && rm -rf /var/lib/apt/lists/*

RUN pip install certbot certbot-nginx

RUN mkdir -p /etc/shadowsocks-rust
COPY shadowsocks.conf /etc/shadowsocks-rust/config.json

RUN rm /etc/nginx/sites-available/* && rm /etc/nginx/sites-enabled/*
COPY nginx_vhost /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ENV HOME="/root"
COPY . $HOME
RUN chmod +x $HOME/docker-entrypoint.sh && chmod +x $HOME/wait-for-it.sh

USER root
WORKDIR $HOME
ENV TZ=Europe/Helsinki

ENTRYPOINT ["./docker-entrypoint.sh"]
