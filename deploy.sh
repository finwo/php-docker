#!/usr/bin/env bash

set -e

# Build
./build.sh

# and Deploy
for version in $(ls build | sort); do
  echo "Deploying $version"
  sleep 2
  docker push finwo/php:$version
done
