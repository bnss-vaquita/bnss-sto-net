ARG ELK_VERSION

# https://github.com/elastic/kibana-docker
FROM docker.elastic.co/kibana/kibana-oss:${ELK_VERSION}

COPY ./keys/* /usr/share/kibana/

USER root
RUN id && ls -alh /usr/share/kibana/ && \
	chown kibana:kibana /usr/share/kibana/kibana.acme.com.*
USER kibana