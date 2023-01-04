#!/usr/bin/env bash

docker_image="chrisemills/gallerydl:latest"
container_name="gallerydl"

docker run -it --rm \
--name $container_name \
-e 'UMASK'='000' \
-e 'PUID'='99' \
-e 'PGID'='100' \
-v "/$(pwd)/output":/output:rw \
-v "/$(pwd)/config":/config:rw \
$docker_image gallery-dl "$@";
