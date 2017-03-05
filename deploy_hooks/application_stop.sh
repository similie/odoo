#!/bin/bash



# if [ docker ps -aq | grep raphter ]
# then
# 	docker stop raphter && docker rm raphter
# fi

# if [ docker images -aq | grep similie/rapher ]
# then
# 	docker rmi  similie/raphter
# fi

app="raphter"
if [ $(docker ps -q -f name="$app") ]; then 
  docker stop "$app" && docker rm -f "$app"
fi


image="similie/raphter"
if [$(docker images -f reference="$image")]; then
  docker rmi "$image" 
fi