#!/bin/bash

SHARED_NETWORK="${1:-local-network}"
SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install artifactory
docker rm -f artifactory &> /dev/null;
docker run --name artifactory --net "$SHARED_NETWORK" -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-oss:latest
