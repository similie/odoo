#!/bin/bash
set -e

CONTAINER=="raphter"

docker rm -f "$CONTAINER" || true

