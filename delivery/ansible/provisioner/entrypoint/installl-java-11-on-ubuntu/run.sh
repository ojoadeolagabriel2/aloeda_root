#!/bin/sh

HOST_FILE=${1:-host}
PROJECT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ansible-playbook -vvv ${PROJECT_DIRECTORY}/main.yml -i "$HOST_FILE"