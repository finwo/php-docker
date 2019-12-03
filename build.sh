#!/usr/bin/env bash

set -e

./prepare.sh

# Build containers
for version in $(ls build | sort); do
  echo "Building $version"
  sleep 2
  docker build -t finwo/php:$version -f build/$version/Dockerfile .
done
