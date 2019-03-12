from alpine:latest

LABEL maintainer="albertoscola221@gmail.com"

RUN apk --no-cache --update add \
		ca-certificates \
		shadow \
		curl \
		file \
		libcap \
		wget \
		suricata \
		python \
		py2-pip \
		libc6-compat curl tar && \
	pip install pyyaml && \
	pip install suricata-update

#RUN usermod -u 2000 suri && \
# 	groupmod -g 2000 suri && \
#	chown suri:suri -R /etc/suricata/ /var/log/suricata && \
	#cp /root/dist/suricata.yaml /etc/suricata/suricata.yaml && \
    #cp /root/dist/*.bpf /etc/suricata/ && \

# Download the latest EmergingThreats ruleset, replace rulebase and enable all rules
    #cp /root/dist/update.sh /usr/bin/ && \
    #chmod 755 /usr/bin/update.sh && \
    #update.sh OPEN && \

# Clean up
#    rm -rf /root/* && \
#    rm -rf /var/cache/apk/*

ADD ./config/suricata.yaml /etc/suricata/suricata.yaml


RUN suricata-update update-sources && \
	suricata-update list-sources && \
	suricata-update enable-source ptresearch/attackdetection && \
	suricata-update enable-source oisf/trafficid && \
	suricata-update enable-source etnetera/aggressive && \
	suricata-update enable-source sslbl/ssl-fp-blacklist && \
	suricata-update

ADD ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
	cd /tmp && \
	curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.6.1-linux-x86_64.tar.gz && \
	tar xzvf filebeat-6.6.1-linux-x86_64.tar.gz

COPY ./filebeat.yml /tmp/filebeat-6.6.1-linux-x86_64/filebeat.yml

