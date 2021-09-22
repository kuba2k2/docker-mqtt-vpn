#!/bin/bash

cd /app

install_packages ca-certificates wget libssl-dev libnacl-dev build-essential

wget -O - https://github.com/eclipse/paho.mqtt.c/archive/master.tar.gz | tar -xzvf -
wget -O - https://github.com/martin-ger/MQTT_VPN/archive/master.tar.gz | tar -xzvf -

cd /app/paho.mqtt.c-master && make install
cd /app/MQTT_VPN-master && make && chmod +x mqtt_vpn && cp mqtt_vpn /usr/local/bin/

apt purge --auto-remove -y build-essential wget

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
