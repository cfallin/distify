#!/bin/bash

if [ ! -f ".prefix" ]; then
    echo Please build first.
    exit 1
fi

prefix=`cat .prefix`

pushd patchelf
make install
popd

mkdir -p $prefix/bin
mkdir -p $prefix/share/distify
cp src/distify $prefix/bin/distify
cp src/distify-whitelist.txt $prefix/share/distify/distify-whitelist.txt
