#!/bin/bash



if [ docker ps -aq | grep raphter ]
then
	docker stop raphter && docker rm raphter
fi

if [ docker images -aq | grep similie/rapher ]
then
	docker rmi  similie/raphter
fi

