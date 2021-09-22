#!/bin/bash

[[ -z "$IF_NAME"  ]] && echo "Specify interface name (IF_NAME)" && exit
[[ -z "$IF_IP"    ]] && echo "Specify interface IP (IF_IP)" && exit
[[ -z "$BROKER"   ]] && echo "Specify broker address (BROKER)" && exit

IF_NAME="-i $IF_NAME"
IF_IP="-a $IF_IP"
BROKER="-b $BROKER"
[[ -z "$NETMASK"  ]] || NETMASK="-m $NETMASK"
[[ -z "$USERNAME" ]] || USERNAME="-u $USERNAME"
[[ -z "$PASSWORD" ]] || PASSWORD="-p $PASSWORD"
[[ -z "$SECRET"   ]] || SECRET="-k $SECRET"
[[ -z "$IF_IPV6"  ]] || IF_IPV6="-6 $IF_IPV6"
[[ -z "$PREFIX"   ]] || PREFIX="-x $PREFIX"
[[ -z "$CLIENTID" ]] || CLIENTID="-n $CLIENTID"
[[ -z "$NAT_IP"   ]] || NAT_IP="-t $NAT_IP"
[[ -z "$DEBUG"    ]] || DEBUG="-d"

mkdir -p /dev/net
mknod /dev/net/tun c 10 200

mqtt_vpn $IF_NAME $IF_IP $BROKER $NETMASK $USERNAME $PASSWORD $SECRET $IF_IPV6 $PREFIX $CLIENTID $NAT_IP $DEBUG
