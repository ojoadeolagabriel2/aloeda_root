#!/usr/bin/env bash

#####################################################################################################################################
# Build & promote k8s app
#####################################################################################################################################

set +e

IMAGE_NAME="aloeda/$1"
VERSION="${2:-1.0}"
PROJECT_DIR="${3}"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "build_and_deploy_docker_image.sh parent directory: ${DIR}"

# prep standalone package
(cd ${PROJECT_DIR} && npm run-script build:standalone)

# wait 3 seconds
sleep 3

# clear existing image
if [[ "$(docker images -q "${IMAGE_NAME}:${VERSION}" 2> /dev/null)" != "" ]]; then
  IMAGE_ID=$(docker images --filter=reference=${IMAGE_NAME} --format "{{.ID}}")
  docker rmi -f ${IMAGE_ID}
  echo "removed ${IMAGE_ID}"
else
  echo "not cleaning..."
fi

# build new image with --rm=true
docker build -t "${IMAGE_NAME}:${VERSION}" --rm=true .