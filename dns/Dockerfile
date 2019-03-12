FROM alpine:latest

RUN apk update && apk add  bind bind-tools bind-libs bind-doc && \
	echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add --update libc6-compat curl tar  && \
    rm -rf /var/cache/apk/*

#libstdc++

ADD data/init.sh /init.sh
RUN chmod 750 /init.sh

COPY data/acme.com.zone /var/bind/
COPY data/named.conf /etc/bind/

ARG DNS_SERVER_IP
ARG VLAN_DOMAIN
ARG FORWARDER

ARG DB_VLAN1
ARG OPENVPN_VLAN1
ARG AUTH_SERVER_VLAN1
ARG ELASTIC_VLAN1
ARG KIBANA_VLAN1
ARG LOGSTASH_VLAN1

RUN sed -i -e "s/DNS_SERVER_IP/${DNS_SERVER_IP}/g" /var/bind/acme.com.zone && \
	sed -i -e "s/DB_VLAN1/${DB_VLAN1}/g" /var/bind/acme.com.zone && \
	sed -i -e "s/OPENVPN_VLAN1/${OPENVPN_VLAN1}/g" /var/bind/acme.com.zone && \
	sed -i -e "s/AUTH_SERVER_VLAN1/${AUTH_SERVER_VLAN1}/g" /var/bind/acme.com.zone && \
	sed -i -e "s/ELASTIC_VLAN1/${ELASTIC_VLAN1}/g" /var/bind/acme.com.zone && \
	sed -i -e "s/KIBANA_VLAN1/${KIBANA_VLAN1}/g" /var/bind/acme.com.zone && \
	sed -i -e "s/LOGSTASH_VLAN1/${LOGSTASH_VLAN1}/g" /var/bind/acme.com.zone


RUN sed -i -e 's@VLAN_DOMAIN@'${VLAN_DOMAIN}'@g'  /etc/bind/named.conf && \
	sed -i -e 's@FORWARDER@'${FORWARDER}'@g'  /etc/bind/named.conf

#RUN cat /etc/bind/named.conf
#RUN cat /var/bind/acme.com.zone



RUN named-checkconf && \
	named-checkzone acme.com /var/bind/acme.com.zone


RUN cd /tmp && \
	curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.6.1-linux-x86_64.tar.gz && \
	tar xzvf filebeat-6.6.1-linux-x86_64.tar.gz

COPY ./filebeat.yml /tmp/filebeat-6.6.1-linux-x86_64/filebeat.yml

#RUN 

	
EXPOSE 53/udp
CMD ["/init.sh"]