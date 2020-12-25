#!/bin/sh

set -ex

echo "$(pwd) is the current output dir"

docker run --rm -v "$(pwd)"/output:/app/output --name=ab ojoadeolagabriel/ab \
  "http://host.docker.internal:8095/api/v1/transfer?reference=TRA-543-318-5633-AA/" 20 1