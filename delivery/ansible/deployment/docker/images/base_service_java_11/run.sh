#!/bin/sh

base_image_name=${BASE_IMAGE_NAME:-platform.v1.aloeda-infrastructure/base_image}
base_image_version=${BASE_IMAGE_VERSION:-1.0}

docker rm -f $base_image_name > /dev/null 2>&1 && echo 'removed container' || echo 'nothing to remove'
docker run -it --name $base_image_name:$base_image_version
docker ps -a