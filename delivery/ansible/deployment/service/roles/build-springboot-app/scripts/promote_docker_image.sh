#!/usr/bin/env bash

set +e

DEFAULT_SONAR_RULE="ALOEDA_WAY"
IMAGE_NAME="aloeda/$1"
VERSION="${2:-1.0}"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# clear existing image
if [[ "$(docker images -q "${IMAGE_NAME}:${VERSION}" 2> /dev/null)" != "" ]]; then
  IMAGE_ID=$(docker images --filter=reference=${IMAGE_NAME} --format "{{.ID}}")
  docker rmi -f ${IMAGE_ID} 2> /dev/null && echo "removed -> ${IMAGE_ID}"
else
  echo "not cleaning: ${IMAGE_NAME}:${VERSION}"
fi

# build new image with --rm=true
docker build -t "${IMAGE_NAME}:${VERSION}" --rm=true .
docker build -t "${IMAGE_NAME}:latest" --rm=true .