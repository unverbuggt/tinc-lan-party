% Tinc-VPN LAN party notes

## Build tinc from git

Install packages (Ubuntu 20.04):

```
sudo apt install git build-essential autoconf texinfo \
    zlib1g-dev liblzo2-dev libssl-dev libncurses-dev \
    libreadline-dev
```

Build and install:

```
sudo apt install meson pkg-config
git clone https://github.com/gsliepen/tinc.git
cd tinc
meson setup build -Dprefix=/usr/local -Dbuildtype=release -Dlzo=disabled -Dlz4=enabled -Dzlib=disabled -Dcrypto=nolegacy -Dsystemd=enabled -Dsysconfdir=/etc -Dlocalstatedir=/var
ninja -C build
sudo ninja -C build install
```

## Extract static configuration

```
sudo tar xzf node.tar.gz -C /etc/tinc/
sudo systemctl enable tinc@__NETWORK_NAME__
sudo systemctl start tinc@__NETWORK_NAME__
```
