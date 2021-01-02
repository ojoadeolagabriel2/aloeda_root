#!/bin/bash

docker rm -f consul &> /dev/null;

docker run \
    -d \
    -p 8500:8500 \
    -p 8600:8600/udp \
    --name=consul \
    --net=local-network \
    consul agent -dev -data-dir=/tmp/consul -node=server-1 -bootstrap-expect=1 -client=0.0.0.0