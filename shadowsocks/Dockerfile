FROM teddysun/shadowsocks-rust:debian-1.13.5

EXPOSE 80
EXPOSE 443

ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get install -y \
    python3 \
    python3-dev \
    python-is-python3 \
    python3-pip \
    nginx-full \
    curl \
    sudo \
    && apt install snapd \
    && rm -rf /var/lib/apt/lists/*

RUN snap install core && snap refresh core && snap install --classic certbot
RUN ln -s /snap/bin/certbot /usr/bin/certbot

RUN mkdir -p /etc/shadowsocks-rust
COPY shadowsocks.conf /etc/shadowsocks-rust/config.json

RUN rm /etc/nginx/sites-available/* && rm /etc/nginx/sites-enabled/*
COPY nginx_vhost /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ENV HOME="/root"
COPY . $HOME
RUN chown -R shadowsocks:shadowsocks $HOME
RUN chmod +x $HOME/docker-entrypoint.sh && chmod +x $HOME/wait-for-it.sh

WORKDIR $HOME
ENV TZ=Europe/Helsinki

ENTRYPOINT ["./docker-entrypoint.sh"]