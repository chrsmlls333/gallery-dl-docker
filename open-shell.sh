#!/usr/bin/env bash

# VARIABLES ########################################################

docker_image="chrisemills/gallerydl:dev"
container_name="gallerydl"
debug_args="--entrypoint //bin/sh"
extra_args=''

# FUNCTIONS ########################################################

docker_run () {
  echo "  Use 'exit' in the container shell to escape.
  "
  docker run -it --rm \
  --name $container_name \
  -e 'UMASK'='000' \
  -e 'PUID'='99' \
  -e 'PGID'='100' \
  -v "/$(pwd)/output":/output:rw \
  -v "/$(pwd)/config":/config:rw \
  $extra_args $docker_image
}

docker_remove () {
  if [ $(docker ps -q -f name=$container_name) ]; then
    docker rm $container_name
  fi
}

docker_autocheck () {
  if [ $(docker ps -q -f name=$container_name) ]
  then
    echo "Auto: $container_name is already running... let's take a peek!"
    docker attach $container_name
  elif [ $(docker ps -aq -f status=exited -f name=$container_name) ]
  then
    echo "Auto: $container_name is stopped... let's start over!"
    docker rm $container_name
    docker_run
  else
    echo "Auto: $container_name doesn't exist... let's fix that!"
    docker_run
  fi
}

usage() { 
  echo "$0 usage:" && grep " .)\ #" $0; exit 0; 
}

# MAIN ##############################################################

if [ $# -eq 0 ]; then
  usage; 
  exit 1;
fi

while getopts 'had' flag; do
  case "${flag}" in
    a) # Auto operation, check docker container status and run/attach.
      docker_autocheck
      ;;
    d) # Use the debug Entrypoint and run a new container.
      extra_args=$debug_args
      docker_remove
      docker_run
      ;;
    h | *) # Display help.
      usage; exit 1;
      ;;
    :) 
      echo "argument missing for $flag"; exit 1;
      ;;
    \?) 
      echo "Something is wrong"; exit 1;
      ;;
  esac
done