#!/bin/bash

docker rm -f pg-docker &> /dev/null;
docker run --rm --name pg-docker --net local-network -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres