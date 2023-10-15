#!/bin/bash

set -e

curl -fsL https://github.com/dio/boringssl-fips/releases/download/fips-20210429-ninja-1.10.2/ninja-arm64.tar.xz | tar -xJ -C /usr/local/bin
curl -fsLO https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-12.0.0.tar.gz | tar -xz
cd llvm-project-llvmorg-12.0.0
mkdir build install
INSTALL_PREFIX=`pwd`/install
cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
  -DLLVM_ENABLE_PROJECTS="clang" \
  -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
  -DCMAKE_BUILD_TYPE=Release \
  -G Ninja \
  -S llvm \
  -B build
ninja -C build install-clang install-clang-resource-headers install-runtimes
