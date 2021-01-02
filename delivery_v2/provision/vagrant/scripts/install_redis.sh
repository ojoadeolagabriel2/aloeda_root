#!/bin/bash

set -ex

SHARED_NETWORK="${1:-local-network}"
CONTAINER_NAME=${2:-redis}

docker rm -f "$CONTAINER_NAME" &>/dev/null && echo 'removed redis container'
docker run --name "$CONTAINER_NAME" --net "$SHARED_NETWORK" -e ALLOW_EMPTY_PASSWORD=yes -d bitnami/redis:latest