#!/bin/bash

set -ex

# install kafka
docker-compose --verbose -f /x/assets/install_kafka.yaml up -d;