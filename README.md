# MQTT_VPN for Docker
A Docker wrapper for [MQTT_VPN](https://github.com/martin-ger/MQTT_VPN), `IP over MQTT for ESP controllers and Linux`.

## Usage

With Docker Compose:
```yml
version: "3.9"
services:
  mqtt:
    environment:
      # uncommented fields are required, all other optional

      # Name of interface to use (mandatory)
      - IF_NAME=mq0
      # IP address of interface to use (mandatory)
      - IF_IP=10.2.0.1
      # Address of MQTT broker (like: tcp://broker.io:1883) (mandatory)
      - BROKER=example.com

      # Netmask of interface to use (default 255.255.255.0)
      # - NETMASK=
      # user of the MQTT broker
      # - USERNAME=
      # password of the MQTT broker user
      # - PASSWORD=
      # preshared key for all clients of this VPN (no password = no encryption, default)
      # - SECRET=
      # IPv6 address of interface to use
      # - IF_IPV6=
      # prefix length of the IPv6 address (default 64)
      # - PREFIX=
      # ID of MQTT client (MQTT_VPN_<random>)
      # - CLIENTID=
      # IP address of a target to NAT
      # - NAT_IP=
      # outputs debug information while running
      # - DEBUG=1

    image: kuba2k2/mqtt-vpn:latest
    network_mode: "host"
    container_name: mqtt-vpn
    cap_add:
      - NET_ADMIN
    restart: unless-stopped
```
