from alpine:latest

LABEL maintainer="albertoscola221@gmail.com"

RUN apk --no-cache add \
		ca-certificates \
		shadow \
		curl \
		file \
		libcap \
		wget \
		suricata

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

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh