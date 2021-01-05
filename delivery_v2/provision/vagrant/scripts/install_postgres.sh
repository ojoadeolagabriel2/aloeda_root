#!/bin/bash

apt install postgresql postgresql-contrib -y

docker rm -f pg-docker &> /dev/null;

docker run -d --rm --net local-network \
  -e POSTGRES_PASSWORD=docker \
  -p 5432:5432 \
  -v "$HOME"/docker/volumes/postgres:/var/lib/postgresql/data \
  --name pg-docker postgres