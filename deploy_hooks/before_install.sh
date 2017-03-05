#!/bin/bash
#cd /home/ubuntu/apps/agromet

app="raphter"
if [ docker ps -q -f name="$app" ]; then 
  docker stop "$app" && docker rm -f "$app"
fi


image="similie/raphter"
if [$(docker images -f reference="$image")]; then
  docker rmi "$image" 
fi