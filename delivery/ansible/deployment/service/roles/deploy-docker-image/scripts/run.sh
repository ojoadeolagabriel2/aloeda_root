#!/bin/sh

IMAGE_HOST_PORT="${1:-8080}"
PROJECT_ARTIFACT_NAME="${2}"
VERSION="1.${3:-1.0}"

IMAGE_NAME="ojoadeolagabriel/${PROJECT_ARTIFACT_NAME}"
IMAGE_NAME_WITH_VERSION="${IMAGE_NAME}:${VERSION}"

# clear existing image
if [[ "$(docker images -q "${IMAGE_NAME_WITH_VERSION}" 2> /dev/null)" != "" ]]; then
  IMAGE_ID=$(docker images --filter=reference=${IMAGE_NAME} --format "{{.ID}}")
  sudo docker rmi -f ${IMAGE_ID} 2> /dev/null && echo "removed -> ${IMAGE_ID}"
else
  echo "not cleaning: ${IMAGE_NAME}:${VERSION}"
fi

sudo docker rm -f ${PROJECT_ARTIFACT_NAME} 2> /dev/null && echo "removed container"
sudo docker run -d -p "${IMAGE_HOST_PORT}:${IMAGE_HOST_PORT}" --name ${PROJECT_ARTIFACT_NAME} "${IMAGE_NAME_WITH_VERSION}"