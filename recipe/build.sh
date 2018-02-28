#!/bin/bash
set -e

# Only on linux/macos
#bash ./autogen.sh

export CFLAGS="-Wno-error $CFLAGS"
export VERBOSE=1

./configure --prefix=$PREFIX \
  --enable-shared \
  --disable-static

make
# only on windows
find tests -type f -name '*.expected' -exec unix2dos {} \;
make check || (cat tests/test-suite.log && exit 1)
make install
