#!/bin/bash

set -e

if [ -d "$1" ]; then
    prefix=$1
else
    prefix=/usr/local
fi

echo Building for prefix $prefix...

git submodule update --init --recursive  # ensure patchelf is checked out.
pushd patchelf/
sh bootstrap.sh
./configure --prefix=$prefix && make
popd

echo $prefix > .prefix
