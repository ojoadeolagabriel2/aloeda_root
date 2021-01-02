#!/bin/sh

###########################################################################
# Author      : adeola ojo
# Description : re-useable reverse proxy gateway
###########################################################################

FILES_PATH="${1:-${PWD}/collection/__files}"
MAPPINGS_PATH="${2:-${PWD}/collection/mappings}"
PORT="${3:-8081}"
CONTAINER_NAME="${4}"
IMAGE_NAME="${5}"
DOCKER_PWD="4bdfc9b0-b2f2-4321-a11c-f97d494a5993"
DOCKER_RUN="${6:-no}"
IMAGE_VERSION="1.${7:-1.0}"

echo $DOCKER_PWD | docker login --username=ojoadeolagabriel --password-stdin
docker rm -f "${CONTAINER_NAME}" 2>&1 && echo "Removed old container ${CONTAINER_NAME}"

# build harness images
docker build -t "${IMAGE_NAME}:latest" .
docker build -t "${IMAGE_NAME}:${IMAGE_VERSION}" .

# push harness images
docker push "${IMAGE_NAME}:latest"
docker push "${IMAGE_NAME}:${IMAGE_VERSION}"

# shellcheck disable=SC2039
if [[ $DOCKER_RUN -eq 'yes' ]]
then
  docker run -d --name "$CONTAINER_NAME" -v "$FILES_PATH":/home/wiremock/__files -v "$MAPPINGS_PATH":/home/wiremock/mappings -it --rm -p "$PORT":8080 "$IMAGE_NAME"
fi

sleep 3