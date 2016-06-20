FROM alpine:3.4

# Install dependencies
RUN apk add --update curl g++ make libstdc++

# Set the version number
ENV VERSION=3.3.6

# Get the code
RUN curl -L https://github.com/sass/libsass/archive/$VERSION.tar.gz | tar -xvzf - -C /usr/local
RUN curl -L https://github.com/sass/sassc/archive/$VERSION.tar.gz | tar -xvzf - -C /usr/local

# Create sassc binary
RUN SASS_LIBSASS_PATH=/usr/local/libsass-$VERSION make BUILD=static -C /usr/local/sassc-$VERSION
RUN cp /usr/local/sassc-$VERSION/bin/sassc /usr/local/bin/sassc
RUN rm -rf /usr/local/libsass-$VERSION /usr/local/sassc-$VERSION

# Clean up
RUN rm -rf /var/cache/apk/*
RUN apk del curl g++ make

ENTRYPOINT ["/usr/local/bin/sassc"]
