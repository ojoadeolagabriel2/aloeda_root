#!/bin/bash

set -ex

docker run -d -p 443:443 --name tower --net=local-network ybalt/ansible-tower