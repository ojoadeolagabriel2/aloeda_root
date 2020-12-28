#!/bin/sh

set -ex

IMAGE_HOST_PORT="${1:-8080}"
PROJECT_ARTIFACT_NAME="${2}"
VERSION="1.${3:-1.0}"
IMAGE_NAME="ojoadeolagabriel/${PROJECT_ARTIFACT_NAME}"
IMAGE_NAME_WITH_VERSION="${IMAGE_NAME}:${VERSION}"

# deploy container
sudo docker rm -f "${PROJECT_ARTIFACT_NAME}" 2> /dev/null && echo "removed container"

# clear orphaned image
docker system prune -af && echo "removed image"

# run new container
sudo docker run --net local-network -d -p "${IMAGE_HOST_PORT}:${IMAGE_HOST_PORT}" --env-file /etc/"$PROJECT_ARTIFACT_NAME".conf --name "${PROJECT_ARTIFACT_NAME}" "${IMAGE_NAME_WITH_VERSION}"