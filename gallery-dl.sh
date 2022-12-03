#!/usr/bin/env bash

docker run -it --rm \
-v "/$(pwd)/output":/output:rw \
-v "/$(pwd)/config":/config:rw \
chrisemills/gallerydl "${1}";
