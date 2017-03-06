#!/bin/bash




CONTAINER=="raphter"

RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)
IMAGE="similie/raphter"
#RUNNING=$(docker ps -q -f name="$CONTAINER" 2> /dev/null)
if [ "$RUNNING" == "true" ]; then 
  docker stop "$CONTAINER" && docker rm "$CONTAINER"
  docker rmi "$IMAGE" 
fi


# image="similie/raphter"
# if [$(docker images -f reference="$image")]; then
#   docker rmi "$image" 
# fi