#!/bin/bash

# Usage: ./setup.sh <interface name>
#                   <private key>
#                   <hub hostname>
#                   <public key>
#                   <interface ip>
#                   <allowed ips>

INTERFACE_NAME=$1
PRIVATE_KEY=$2
HUB_HOSTNAME=$3
PUBLIC_KEY=$4
INTERFACE_IP=$5
ALLOWED_IPS=$6

# Install wireguard

sudo apt-get install wireguard

# Configure wireguard

cat >$INTERFACE_NAME.conf << EOF
[Interface]
PrivateKey=$PRIVATE_KEY
Address=$INTERFACE_IP/32

[Peer]
PublicKey=$PUBLIC_KEY
Endpoint=$HUB_HOSTNAME
AllowedIPs=$ALLOWED_IPS
PersistentKeepalive=15
EOF

sudo mv $INTERFACE_NAME.conf /etc/wireguard/

# Start wireguard

sudo wg-quick up $INTERFACE_NAME

sudo wg show $INTERFACE_NAME