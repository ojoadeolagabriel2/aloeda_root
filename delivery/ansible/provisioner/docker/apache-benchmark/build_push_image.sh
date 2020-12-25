#!/bin/sh

set -ex

# vars
VERSION="1.$(date +%Y%m%d%H%M%S)"
DOCKER_ACCESS_TOKEN="${1:-4b50ccd5-1494-48ab-8fed-f20dd27f671c}"

# login to docker
echo "$DOCKER_ACCESS_TOKEN" | docker login --username ojoadeolagabriel --password-stdin

# build images
docker build -t ojoadeolagabriel/ab:latest .
docker build -t ojoadeolagabriel/ab:"$VERSION" .

# push images
docker push ojoadeolagabriel/ab:latest
docker push ojoadeolagabriel/ab:"$VERSION"