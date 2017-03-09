#!/bin/bash
set -e

docker rm -f raphter || true

docker run -d -p 8069:8069  --restart=always --name raphter similie/raphter