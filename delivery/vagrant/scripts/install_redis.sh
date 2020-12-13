#!/bin/bash

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=${1:-redis}

docker rm -f $IMAGE &> /dev/null;
docker run --name $IMAGE --net local-network -e ALLOW_EMPTY_PASSWORD=yes -d bitnami/redis:latest