#!/bin/bash
set -e

bash ./autogen.sh

export  CFLAGS="-Wno-error $CFLAGS"

./configure --prefix=$PREFIX \
  --enable-shared \
  --disable-static

make
make check || (cat tests/test.log && exit 1)
make install
