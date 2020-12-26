#!/bin/bash

set -ex

SHARED_NETWORK="${1:-local-network}"
IMAGE=${1:-redis}

docker rm -f "$IMAGE" &> /dev/null;
docker run --name "$IMAGE" --net "$SHARED_NETWORK" -e ALLOW_EMPTY_PASSWORD=yes -d bitnami/redis:latest