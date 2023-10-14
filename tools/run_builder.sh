#!/bin/bash

set -e

docker buildx build \
  --file tools/"$OS"/builder.Dockerfile \
  --load \
  --tag builder \
  --platform linux/"$ARCH" \
  --no-cache \
  .
