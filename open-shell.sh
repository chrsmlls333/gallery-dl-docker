#!/usr/bin/env bash

cname="gallerydl"

run () {
  docker run -it --rm \
  --name $cname \
  -v "/$(pwd)/output":/output:rw \
  -v "/$(pwd)/config":/config:rw \
  --entrypoint '//bin/bash' \
  chrisemills/gallerydl:dev
}

if [ $(docker ps -q -f name=$cname) ]
then
  echo "$cname is already running... let's take a peek!"
  docker attach $cname
elif [ $(docker ps -aq -f status=exited -f name=$cname) ]
then
  echo "$cname is stopped... let's start over!"
  docker rm $cname
  run
else
  echo "$cname doesn't exist... let's fix that!"
  run
fi
