FROM alpine:latest

RUN apk update && apk add  bind bind-tools bind-libs bind-doc && \
    rm -rf /var/cache/apk/*

ADD data/init.sh /init.sh
RUN chmod 750 /init.sh

COPY data/acme.com.zone /var/bind/
COPY data/named.conf /etc/bind/

ARG DNS_SERVER_IP
ARG VLAN_DOMAIN
ARG FORWARDER

ARG DB_VLAN1
ARG OPENVPN_VLAN1

RUN sed -i -e "s/DNS_SERVER_IP/${DNS_SERVER_IP}/g" /var/bind/acme.com.zone
RUN sed -i -e "s/DB_VLAN1/${DB_VLAN1}/g" /var/bind/acme.com.zone
RUN sed -i -e "s/OPENVPN_VLAN1/${OPENVPN_VLAN1}/g" /var/bind/acme.com.zone


RUN sed -i -e 's@VLAN_DOMAIN@'${VLAN_DOMAIN}'@g'  /etc/bind/named.conf
RUN sed -i -e 's@FORWARDER@'${FORWARDER}'@g'  /etc/bind/named.conf

#RUN cat /etc/bind/named.conf
#RUN cat /var/bind/acme.com.zone



RUN named-checkconf && \
	named-checkzone acme.com /var/bind/acme.com.zone 
	
EXPOSE 53/udp
CMD ["/init.sh"]