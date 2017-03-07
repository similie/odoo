#!/bin/bash
set -e

CONTAINER=="raphter"

IMAGE="similie/raphter"

docker rm -f "$CONTAINER" || true
docker rmi -f "$IMAGE" || true 
