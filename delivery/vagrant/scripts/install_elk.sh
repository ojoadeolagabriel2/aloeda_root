#!/bin/bash

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install elk
docker rm -f elk &> /dev/null;
docker run --name elk --net local-network -d -p 9200:9200 -e "discovery.type=single-node" \
    -v esdata:/usr/share/elasticsearch/data docker.elastic.co/elasticsearch/elasticsearch:6.4.2