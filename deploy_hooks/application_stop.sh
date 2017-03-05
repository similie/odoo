#!/bin/bash
if [ docker ps -aq raphter ]
then
	docker stop raphter && docker rm raphter
fi

if [ docker images -aq similie/rapher ]
then
	docker rmi  similie/raphter
fi

