#!/bin/sh

if [ ! -f /etc/openvpn/keys/ta.key ]; then
    cd /etc/openvpn/keys/
    openvpn --genkey --secret ta.key
fi

#mkdir -p /dev/net
#mknod /dev/net/tun c 10 200
#chmod 0666 /dev/net/tun

#iptables -L -v
#iptables -A INPUT -p UDP --dport 1194 -j ACCEPT && \
#iptables -A INPUT -s 192.168.50.0/24 -j ACCEPT && \
#iptables -A FORWARD -s 192.168.50.0/24 -j ACCEPT && \
#iptables -A FORWARD -d 192.168.50.0/24 -j ACCEPT && \
#iptables -t nat -A POSTROUTING -s 192.168.50.0/24 -j MASQUERADE

#exec openvpn --config /etc/openvpn/server.conf
sleep 100000000