#!/bin/bash

SHARED_NETWORK="${1:-local-network}"

# install artifactory
docker rm -f artifactory &> /dev/null;
docker run --name artifactory --net "$SHARED_NETWORK" -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-oss:latest