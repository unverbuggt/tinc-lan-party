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
git clone https://github.com/gsliepen/tinc.git
cd tinc
autoreconf -fsi
./configure --disable-legacy-protocol --with-systemd --sysconfdir=/etc --localstatedir=/var
make
sudo make install-strip
```

## Extract static configuration

```
sudo tar xzf node.tar.gz -C /etc/tinc/
sudo systemctl enable tinc@node
sudo systemctl start tinc@node
```
