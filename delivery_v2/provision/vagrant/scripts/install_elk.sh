#!/bin/bash

SHARED_NETWORK="${1:-local-network}"

# install elk
docker rm -f elk &> /dev/null;
docker run --name elk --net "$SHARED_NETWORK" -d -p 9200:9200 -e "discovery.type=single-node" \
    -v esdata:/usr/share/elasticsearch/data docker.elastic.co/elasticsearch/elasticsearch:6.4.2