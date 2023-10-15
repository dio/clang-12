#!/bin/bash

set -e

docker buildx build \
  --file tools/"$OS"/builder.Dockerfile \
  --load \
  --tag builder \
  --platform linux/"$ARCH" \
  --no-cache \
  .
  CONTAINER_ID=$(docker create -it builder)
  docker cp $CONTAINER_ID:/clang+llvm-12.0.0-aarch64-linux-centos-stream8.tar.xz .
