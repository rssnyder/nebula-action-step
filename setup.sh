#!/bin/bash

# Download Nebula

curl -L https://github.com/slackhq/nebula/releases/download/v1.3.0/nebula-linux-amd64.tar.gz -o /tmp/nebula.tar.gz

sudo mkdir -p /etc/nebula
sudo tar zxfv /tmp/nebula.tar.gz /etc/nebula/

# Setup configuration

echo $NEBULA_NODE_CRT > /etc/nebula/host.crt
echo $NEBULA_NODE_KEY > /etc/nebula/host.key
echo $NEBULA_NODE_CONF | base64 -d > /etc/nebula/config.yml
echo $NEBULA_CA_CRT > /etc/nebula/ca.crt

# Install service file

sudo cp nebula.service /etc/systemd/system/

sudo systemctl daemon-reload

sudo systemctl start nebula.service
