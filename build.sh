#!/bin/bash
set -e
 
#if ! [[ -d ./logs/ ]]; then
#    mkdir -p ./logs/
#fi

# BUILD DOCKER CONTAINERS
docker-compose up --build