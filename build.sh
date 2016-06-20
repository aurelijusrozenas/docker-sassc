#!/bin/sh

set -e

apk add --update curl g++ make libstdc++

# Fetch
curl -L https://github.com/sass/libsass/archive/$VERSION.tar.gz | tar -xvz -C /usr/local
curl -L https://github.com/sass/sassc/archive/$VERSION.tar.gz | tar -xvz -C /usr/local

# Create binary
SASS_LIBSASS_PATH=/usr/local/libsass-$VERSION make BUILD=static -C /usr/local/sassc-$VERSION
cp /usr/local/sassc-$VERSION/bin/sassc /usr/local/bin/sassc

# Clean
rm -rf /usr/local/sassc-$VERSION /usr/local/libsass-$VERSION
apk del curl g++ make
rm -rf /var/cache/apk/*

