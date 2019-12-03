#!/usr/bin/env bash

set -e

# Download preprocessor
[ -f "bashpp" ] || {
  curl -Ls https://raw.githubusercontent.com/iwonbigbro/bashpp/master/bin/bashpp > bashpp
  chmod +x bashpp
}

# Rebuild 'build' directory
rm -rf build
mkdir build

# Render dockerfiles
for version in $(ls src | grep \\. | sort); do
  major=$(echo $version | tr '.' ' ' | awk '{print $1}')
  rm -f build/$major build/latest
  ln -s $version build/$major
  ln -s $version build/latest
  mkdir build/$version
  ./bashpp -I . -o build/$version/Dockerfile src/$version/Dockerfile
done
