FROM alpine:latest
LABEL maintainer="albertoscola221@gmail.com"

RUN apk update && apk add openvpn && \
	apk add iptables && \
	apk add --update bind-tools && \
	rm -rf /var/cache/apk/*

#ADD ../resolv.conf /etc/resolv.conf

ARG VLAN_VPN_CLIENTS_SUBNET
ARG DNS_SERVER_IP

COPY data/ccd /etc/openvpn/ccd
COPY data/keys /etc/openvpn/keys
COPY data/server.conf /etc/openvpn/

RUN ls -alh /etc/openvpn/ && \
	sed -i -e "s/VLAN_VPN_CLIENTS_SUBNET/${VLAN_VPN_CLIENTS_SUBNET}/g" /etc/openvpn/server.conf
RUN sed -i -e "s/DNS_SERVER_IP/${DNS_SERVER_IP}/g" /etc/openvpn/server.conf

ADD start.sh /etc/openvpn/start.sh
RUN chmod 770 /etc/openvpn/start.sh

#RUN sed -i -e "s/VLAN_VPN_CLIENTS_SUBNET/${VLAN_VPN_CLIENTS_SUBNET}/g" /etc/openvpn/start.sh


EXPOSE 1194/udp

ENTRYPOINT ["/etc/openvpn/start.sh"]
