# tinc-lan-party
Script to generate configurations and scripts for [tinc-vpn](https://www.tinc-vpn.org/) to enable LAN(or rather VPN) partys over the Internet.

## Introduction
During the pandemic some friends and I had the idea to relocate the usual once-a-year LAN party to the Internet. Of course it is not a good idea to set up dyndns and port forward a 20 year old game to the Internet, also renting and setting up gaming servers is hardly feasible. After some research I found tinc which is capable of forming a low-latency peer-to-peer VPN (at least with the 1.1pre branch). First I hand-crafted the configuration and scripts, later I put together this repo. We've been gaming every Friday ever since.

## Setup
In our setup we used one (later two) cheap vserver to provide a tinc entry connection point (also to host a [Mumble](https://www.mumble.info/) Voice Chat Server). Every dynamic node first connects here and then gets the connection details of all the other nodes.
All participants receive an archive containing the dynamic node scripts and keys for their platform. Everybody just needs to make sure that each node name is just used once.

## Generating
The script will use tinc to generate the public/private key pairs of all nodes and will output a package for Windows nodes, Linux nodes and static nodes (see _out directory). You can configure the static nodes in the [nodes-static.txt](nodes-static.example.txt) file and the dynamic nodes in the [nodes-dynamic.txt](nodes-dynamic.example.txt) file. In the beginning of the `generate-config` script you'll see some customizable variables:

```
#config
VPN_NETWORK=192.168.235
LAST_OCTET=1 #for static nodes
LAST_OCTET_DYN=100 #for dynamic nodes
TAP_ADAPTER_NAME=TAP1
DYN_TINC_PORT=655 #tinc needs CAP_NET_BIND_SERVICE for ports < 1024 in linux! see NOTES
COMPRESSION=0 #0=no compression, 12=lz4
```

`VPN_NETWORK` lets you change the private class C network (192.168.x). 

`LAST_OCTET` is the VPN IP adress of the first static node. It is advised to start at 1, this address will also receive a static MAC address, which is good for Windows because so it can remember the network.

`TAP_ADAPTER` is the name of the TAP Adapter in Windows and Linux.

`COMPRESSION` we've tested both no compression an lz4. For pings it doesn't make a huge difference. It could be that lz4 compression prevents huge packets from fragmenting.

It would also be possible to setup a running VPN without using static nodes. In this case one of the dynamic node will need to setup dyndns or have a fixed IP address.

Start by deleting the "_out" directory: `rm -R _out/`

Run the script: `./generate-config`

You can always regenerate with changed settings by calling the script again. The "store" directory holds all the files needed for regeneration.

## Configuration
Further NOTES on how to setup the configuration is provided for [Windows](in/NOTES.windows.md), [Linux](in/NOTES.linux.md) and [static nodes](in/NOTES.static.md)
