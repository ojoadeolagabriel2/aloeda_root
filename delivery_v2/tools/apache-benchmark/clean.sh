#!/bin/sh -xe

docker system prune -af
sh build_push_image.sh