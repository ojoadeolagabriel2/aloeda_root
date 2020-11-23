#!/bin/sh

###########################################################################
# Author      : adeola ojo
# Description : re-useable reverse proxy gateway
###########################################################################

FILES_PATH="${1:-${PWD}/collection/__files}"
MAPPINGS_PATH="${2:-${PWD}/collection/mappings}"
PORT="${3:-8080:8080}"

CONTAINER_NAME="${4}"
IMAGE_NAME="${5}"
DOCKER_PWD="${6:-a2f66114-2a13-4275-9f5a-9d429fedb519}" # dont forget to remove this
DOCKER_RUN="${7:-no}"

echo $DOCKER_PWD | docker login --username=ojoadeolagabriel --password-stdin
docker rm -f ${CONTAINER_NAME} &>/dev/null && echo "Removed old container ${CONTAINER_NAME}"

docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME

if [[ $DOCKER_RUN -eq 'yes' ]]
then
  docker run -d --name $CONTAINER_NAME -v $FILES_PATH:/home/wiremock/__files -v $MAPPINGS_PATH:/home/wiremock/mappings -it --rm -p $PORT $IMAGE_NAME
fi

sleep 3