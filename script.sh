#!/bin/bash

TAG="r-example:latest"

# Check if "build" parameter is provided
if [ "$1" = "build" ]; then
  echo "Building the project..."
  docker build -t "${TAG}" -f ./docker/Dockerfile .

# Check if "run" parameter is provided
elif [ "$1" = "run" ]; then
  echo "Running the project..."
  docker run --env-file ./.env "${TAG}"

elif [ "$1" = "shell" ]; then
  echo "Start a hanging container and exec shell.."
  CONTAINER_NAME=r-debug-shell
  docker run --rm --name $CONTAINER_NAME -d $TAG tail -f /dev/null
  docker exec -it $CONTAINER_NAME bash
  docker stop $CONTAINER_NAME

else
  echo "Invalid parameter. Please provide either 'build' or 'run'."
fi