#!/bin/bash
docker stop raphter || true
docker rm raphter || true
docker rmi  similie/raphter || true

