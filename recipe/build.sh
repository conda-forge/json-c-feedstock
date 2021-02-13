#!/bin/bash

# https://github.com/json-c/json-c/issues/406
export CPPFLAGS="${CPPFLAGS/-DNDEBUG/}"

mkdir build
cd build
cmake $CMAKE_ARGS ..

make ${VERBOSE_AT}
if [ "${build_platform}" = "${target_platform}" ]; then
    make test ${VERBOSE_AT}
fi
make install

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
