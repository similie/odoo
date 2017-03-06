#!/bin/bash




CONTAINER=="raphter"

# RUNNING=docker ps -q -f name="$CONTAINER"; 
#$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)
IMAGE="similie/raphter"
#RUNNING=$(docker ps -q -f name="$CONTAINER" 2> /dev/null)
if [$(docker ps -q -f name="$CONTAINER")]; then 
  docker stop "$CONTAINER" && docker rm "$CONTAINER"
  #docker rmi "$IMAGE" 
fi

if [$(docker images | grep "$IMAGE")]; then
  docker rmi "$IMAGE" 
fi