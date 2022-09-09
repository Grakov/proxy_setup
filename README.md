# Proxy setup
Set of scripts to easy setup proxy or VPN on your own server.

## Supported protocols
Currently supported only **Shadowsocks** with V2Ray extension.

### Shadowsocks + V2Ray
[Shadowsocks](https://shadowsocks.org) is fast and lightweight proxy protocol.
However it could be detected via DPI and blocked by your ISP/government/etc. So it's better to use some obfuscation, to hide it's usage.

[V2Ray](https://v2ray.com/en/) allows to mask your traffic, hiding it via TLS.
In this case, Shadowsocks traffic are wrapped into Websocket over HTTPS.
From DPI view it looks as legit HTTPS traffic.

To get free SSL certificate we use Let's Encrypt and `certbot` tool.

#### Server setup
Assumed what you already has a server and domain or subdomain, with correct A/AAAA DNS record, that points to your server.

* Clone project and go to `shadowsocks` directory.
* Replace example domain in all config files by your own domain. For example, you can use this command:
```
sed -i -e 's/example\.com/yourdomain\.com/g' *
```
* Execute `start.sh` script and wait until SSL certificate will be issued.
* Import config to your Shadowsocks client: `client-shadowsocks-libev.conf` for Linux and `client.conf` for other platforms.

#### Client setup
##### Windows
* Download [Windows GUI client](https://github.com/shadowsocks/shadowsocks-windows/releases) and install it.
* Download and unpack [V2Ray plugin](https://github.com/shadowsocks/v2ray-plugin/releases) executable. Rename it to `v2ray-plugin.exe` and put to Shadowsocks folder.

##### Linux
You can use `shadowsocks-libev`.

##### macOS
You can use [ShadowsocksX-NG](https://github.com/shadowsocks/ShadowsocksX-NG). However, it's not maintained, so you can setup raw Shadowsocks server and use Outline client.

##### Android
* Download and install [Shadowsocks for Android](https://github.com/shadowsocks/shadowsocks-android)
* Download and install [v2ray-plugin for shadowsocks-android](https://github.com/shadowsocks/v2ray-plugin-android)

##### iOS
You can install [Shadowrocket](https://apps.apple.com/ru/app/shadowrocket/id932747118). It supports V2Ray out of box.
