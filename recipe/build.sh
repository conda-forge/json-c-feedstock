#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

bash ./autogen.sh

# https://github.com/json-c/json-c/issues/406
export CPPFLAGS="${CPPFLAGS/-DNDEBUG/}"

./configure --prefix=$PREFIX --host=$HOST --build=$BUILD

make ${VERBOSE_AT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check ${VERBOSE_AT}
fi
make install

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
