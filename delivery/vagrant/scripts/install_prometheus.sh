#!/bin/bash

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

IMAGE=${1:-prometheus}

# drop container
docker rm -f $IMAGE &> /dev/null;

# install prometheus
docker run \
        --name $IMAGE \
        --net local-network \
        -p 9090:9090 \
        -d \
        -v "/x/scripts/prometheus.yml:/etc/prometheus/prometheus.yml" \
        prom/prometheus