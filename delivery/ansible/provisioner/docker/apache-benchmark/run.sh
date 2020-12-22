#!/bin/sh -xe

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "app:/app" ab \
    /usr/bin/ab -n 100 -c 5 "http://host.docker.internal:8094/api/v1/merchant" >./app/result.txt 2>&1
