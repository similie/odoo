#!/bin/bash


set -e

CONTAINER=="raphter"

# RUNNING=docker ps -q -f name="$CONTAINER"; 
#$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)
IMAGE="similie/raphter"

docker rm -f "$CONTAINER" || true


docker rmi -f "$IMAGE" || true 
#RUNNING=$(docker ps -q -f name="$CONTAINER" 2> /dev/null)
# if [$(docker ps -q -f name="$CONTAINER")]; then 
#   docker rm -f "$CONTAINER" || true
#   #docker rmi "$IMAGE" 
# fi

# if [$(docker images | grep "$IMAGE")]; then
#   docker rmi "$IMAGE" 
# fi