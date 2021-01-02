#!/bin/bash

SHARED_NETWORK="${1:-local-network}"
IMAGE=${2:-prometheus}

# drop container
docker rm -f "$IMAGE" &> /dev/null;

# install prometheus
docker run \
        --name "$IMAGE" \
        --net "$SHARED_NETWORK" \
        -p 9090:9090 \
        -d \
        -v "/x/scripts/prometheus.yml:/etc/prometheus/prometheus.yml" \
        prom/prometheus