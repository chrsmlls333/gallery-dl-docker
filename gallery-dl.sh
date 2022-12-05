#!/usr/bin/env bash

docker run -it --rm \
-e 'UMASK'='000' \
-e 'PUID'='99' \
-e 'PGID'='100' \
-v "/$(pwd)/output":/output:rw \
-v "/$(pwd)/config":/config:rw \
chrisemills/gallerydl "$@";
