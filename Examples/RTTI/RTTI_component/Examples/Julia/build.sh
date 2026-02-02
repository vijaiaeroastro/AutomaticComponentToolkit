#!/bin/bash

set -euxo pipefail

cd "$(dirname "$0")"
source ../../../../../Build/build.inc

which julia

mkdir -p /tmp/julia_home /tmp/julia_depot

echo "Test C++ library"
RUN "HOME=/tmp/julia_home JULIA_DEPOT_PATH=/tmp/julia_depot julia RTTI_Example.jl" $PWD/../../Implementations/Cpp/build

echo "Test Pascal library"
RUN "HOME=/tmp/julia_home JULIA_DEPOT_PATH=/tmp/julia_depot julia RTTI_Example.jl" $PWD/../../Implementations/Pascal/build
