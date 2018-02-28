#!/bin/bash
set -e

# Only on linux/macos
#bash ./autogen.sh

export  CFLAGS="-Wno-error $CFLAGS"

./configure --prefix=$PREFIX \
  --enable-shared \
  --disable-static

make
make check || (cat tests/test-suite.log && exit 1)
make install
