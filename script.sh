#!/bin/bash

TAG="r-example:latest"

# Check if "build" parameter is provided
if [ "$1" = "build" ]; then
  echo "Building the project..."
  docker build -t "${TAG}" -f ./docker/Dockerfile .

# Check if "run" parameter is provided
elif [ "$1" = "run" ]; then
  echo "Running the project..."
  docker run "${TAG}"

# No valid parameter provided
else
  echo "Invalid parameter. Please provide either 'build' or 'run'."
fi