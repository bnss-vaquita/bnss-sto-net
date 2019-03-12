FROM mysql:latest
LABEL maintainer="albertoscola221@gmail.com"

ARG MYSQL_CONTAINER_USER
ARG MYSQL_CONTAINER_GROUP
ARG MYSQL_DATA_DIR
ARG MYSQL_LOG_DIR
ARG RADIUS_USR_PASSWORD 
ARG RADIUS_VLAN1
ARG DB_VLAN1

ARG AUTH_SERVER_USER
ARG AUTH_SERVER_USR_PASSWORD

ARG OPENVPN_DB_PASS
ARG OPENVPN_DB_USER


COPY my.cnf /etc/my.cnf

#COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY sql/*.sql /docker-entrypoint-initdb.d/
COPY certs/* /mysql-certs/

RUN mkdir ${MYSQL_LOG_DIR} && \
	usermod -u 1000 ${MYSQL_CONTAINER_USER} && \
 	groupmod -g 1000 ${MYSQL_CONTAINER_GROUP} && \
	chown ${MYSQL_CONTAINER_USER}:${MYSQL_CONTAINER_USER} -R ${MYSQL_DATA_DIR} ${MYSQL_LOG_DIR} /docker-entrypoint-initdb.d && \
	sed -i -e 's@RADIUS_USR_PASSWORD@'${RADIUS_USR_PASSWORD}'@g' /docker-entrypoint-initdb.d/radius_setup.sql && \
	sed -i -e 's@RADIUS_VLAN1@'${RADIUS_VLAN1}'@g' /docker-entrypoint-initdb.d/radius_setup.sql && \
	sed -i -e 's@AUTH_SERVER_USER@'${AUTH_SERVER_USER}'@g' /docker-entrypoint-initdb.d/radius_setup.sql && \
	sed -i -e 's@AUTH_SERVER_USR_PASSWORD@'${AUTH_SERVER_USR_PASSWORD}'@g' /docker-entrypoint-initdb.d/radius_setup.sql && \
	sed -i -e 's@OPENVPN_DB_PASS@'${OPENVPN_DB_PASS}'@g' /docker-entrypoint-initdb.d/radius_setup.sql && \
	sed -i -e 's@OPENVPN_DB_USER@'${OPENVPN_DB_USER}'@g' /docker-entrypoint-initdb.d/radius_setup.sql && \
	chown ${MYSQL_CONTAINER_USER}:${MYSQL_CONTAINER_USER} -R /mysql-certs/

EXPOSE 3306

#RUN sed -i -e 's/deb /deb [trusted=yes] /g' /etc/apt/sources.list && \
#	cat /etc/apt/sources.list && \
	#rm -rf /etc/apt/trusted.gpg.d/* && \
#	ls -alh /etc/apt/trusted.gpg.d

#rm -r /var/lib/apt/lists 
#mkdir -p /var/lib/apt/lists/partial && \

RUN apt-get clean && \
	apt upgrade && \
	apt update  --allow-unauthenticated && apt install curl tar procps -y  && \
	cd /tmp && \
	curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.6.1-linux-x86_64.tar.gz && \
	tar xzvf filebeat-6.6.1-linux-x86_64.tar.gz

COPY ./filebeat.yml /tmp/filebeat-6.6.1-linux-x86_64/filebeat.yml


#COPY ./init.sh /docker-entrypoint-initdb.d/filebeat.sh


#RUN chmod 750 /init.sh && \

#COPY ./init.sh /init.sh
#RUN chmod 750 /init.sh && \
#	/init.sh

#RUN chmod +x /etc/init.d/filebeat.sh && \
#	update-rc.d filebeat.sh defaults && \
#	update-rc.d filebeat.sh enable

COPY start.sh /start.sh
RUN chmod 750 /start.sh
CMD /start.sh
