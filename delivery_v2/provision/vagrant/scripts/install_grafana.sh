#!/bin/bash

SHARED_NETWORK="${1:-local-network}"

# install grafana
docker rm -f grafana &> /dev/null;
docker run -d -p 3000:3000 --net "$SHARED_NETWORK" --name grafana grafana/grafana