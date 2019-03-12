#!/bin/sh

#
# Start filebeat.
#

cd /tmp/filebeat-6.6.1-linux-x86_64 && export PATH=$PATH:`pwd` 
filebeat test config 
filebeat modules enable mysql
#filebeat setup
filebeat -e &

#filebeat setup -e \
#	-E output.logstash.enabled=false \
#	-E output.elasticsearch.hosts=192.168.5.20:9200 \
#	-E setup.kibana.host=192.168.5.21:5601

#echo $?

echo "finished"
