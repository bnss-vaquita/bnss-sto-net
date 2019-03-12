#!/bin/bash
set -e
 
if ! [[ -d ./ids/logs/ ]]; then
    mkdir -p ./ids/logs
fi

if ! [[ -d ./openvpn/data/logs/ ]]; then
    mkdir -p ./openvpn/data/logs
fi

if ! [[ -d ./dns/log/ ]]; then
    mkdir -p ./dns/log
fi

if ! [[ -d ./radius/logs/ ]]; then
    mkdir -p ./radius/logs
fi

if ! [[ -d ./mysql/data/ ]]; then
    mkdir -p ./mysql/data
fi

if ! [[ -d ./mysql/log/ ]]; then
    mkdir -p ./mysql/log
fi








# BUILD DOCKER CONTAINERS
docker-compose up --build