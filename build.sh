#!/usr/bin/env bash

IMAGE_NAME=adkaster/serenityos

cd $(dirname $(realpath ${BASH_SOURCE[0]}))

rm -rf ./serenity

set -e -o

export DOCKER_BUILDKIT=1

docker build --rm --cache-from=$IMAGE_NAME:base -t $IMAGE_NAME:base -f Dockerfile.base .

git clone --depth=1 https://github.com/SerenityOS/serenity.git --depth=1

docker build --rm --cache-from=$IMAGE_NAME:gcc -t $IMAGE_NAME:gcc -f Dockerfile.gcc .
docker build --rm --cache-from=$IMAGE_NAME:clang -t $IMAGE_NAME:clang -f Dockerfile.clang .
