#!/usr/bin/env bash

cname="gallerydl"

run () {
  docker run -it --rm \
  --name $cname \
  -e 'UMASK'='000' \
  -e 'PUID'='99' \
  -e 'PGID'='100' \
  -v "/$(pwd)/output":/output:rw \
  -v "/$(pwd)/config":/config:rw \
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
