#!/usr/bin/env bash

base_image_name=${BASE_IMAGE_NAME:-platform.v1.aloeda-infrastructure/base_image}
base_image_version=${BASE_IMAGE_VERSION:-1.0}

echo $base_image_name $base_image_version

docker system prune
docker build -t $base_image_name:$base_image_version .