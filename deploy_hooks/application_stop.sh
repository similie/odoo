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
if docker ps | awk -v app="app" 'NR>1{  ($(NF) == app )  }'; then
  docker stop "$app" && docker rm -f "$app"
fi


app="similie/raphter"
if docker images | awk -v app="app" 'NR>1{  ($(NF) == app )  }'; then
  docker rmi "$app" 
fi