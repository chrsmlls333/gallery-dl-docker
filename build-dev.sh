#!/usr/bin/env bash 

docker_image="chrisemills/gallerydl:dev"

docker build --pull --rm -f "Dockerfile" -t $docker_image "."