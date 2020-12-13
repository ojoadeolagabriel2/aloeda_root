#!/bin/bash

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install grafana
docker rm -f grafana &> /dev/null;
docker run -d -p 3000:3000 --net local-network --name grafana grafana/grafana