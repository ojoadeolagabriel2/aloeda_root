#!/bin/sh

docker rm -f service_image > /dev/null 2>&1 && echo 'removed container' || echo 'nothing to remove'
docker run -it -d --name service_image service_image:1.0
docker ps -a