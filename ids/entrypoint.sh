#!/bin/sh
cd /tmp/filebeat-6.6.1-linux-x86_64 && export PATH=$PATH:`pwd`
filebeat modules enable suricata
filebeat setup
filebeat -e &

suricata -i wlp59s0