#!/bin/sh

set -ex

IMAGE_HOST_PORT="${1:-8080}"
PROJECT_ARTIFACT_NAME="${2}"
VERSION="1.${3:-1.0}"
DOCKER_ACCESS_TOKEN="326d759f-6113-45d0-b299-0a115c7e7c75"
DOCKER_USERNAME="ojoadeolagabriel"

# image vectors
IMAGE_NAME="ojoadeolagabriel/${PROJECT_ARTIFACT_NAME}"
IMAGE_NAME_WITH_VERSION="${IMAGE_NAME}:${VERSION}"

# login to remote docker instance
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_ACCESS_TOKEN"

# deploy container
sudo docker rm -f "${PROJECT_ARTIFACT_NAME}" 2> /dev/null && echo "removed container $IMAGE_NAME_WITH_VERSION"

# clear orphaned image
docker system prune -af && echo "removed image"

# run new container
sudo docker run --net local-network -d -p "${IMAGE_HOST_PORT}:${IMAGE_HOST_PORT}" -e TZ=Australia/Brisbane --env-file /etc/"$PROJECT_ARTIFACT_NAME".conf --name "${PROJECT_ARTIFACT_NAME}" "${IMAGE_NAME_WITH_VERSION}"