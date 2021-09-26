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
./configure --disable-legacy-protocol
make
sudo make install-strip
```

## Extract static configuration

<pre>
sudo tar xzf <b>node</b>.tar.gz -C /etc/tinc/
sudo systemctl enable tinc@<b>node</b>
sudo systemctl start tinc@<b>node</b>
</pre>
