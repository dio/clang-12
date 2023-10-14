#!/bin/bash

set -e

curl -fsLO https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-12.0.1.tar.gz
tar -xzf llvmorg-12.0.1.tar.gz
cd llvm-project-llvmorg-12.0.1
mkdir build install
cd build
INSTALL_PREFIX=`pwd`/install
cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm
make -j4
