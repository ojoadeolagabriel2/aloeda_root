#!/bin/bash

SHARED_NETWORK="${1:-local-network}"

# install splunk
docker rm -f splunk &> /dev/null;
docker run -d --net "$SHARED_NETWORK" -p 7080:8000 -e "SPLUNK_START_ARGS=--accept-license" -e "SPLUNK_PASSWORD=password" --name splunk splunk/splunk:latest