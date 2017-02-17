FROM alpine:3.4

# Set the version number
ENV VERSION=3.3.6

# Make sassc standard entrypoint
ENTRYPOINT ["/usr/local/bin/sassc"]

# Install dependencies
RUN apk add --update curl g++ make libstdc++ \

# Get the code
&& curl -L https://github.com/sass/libsass/archive/$VERSION.tar.gz | tar -xvzf - -C /usr/local \
&& curl -L https://github.com/sass/sassc/archive/$VERSION.tar.gz | tar -xvzf - -C /usr/local \

# Create sassc binary
&& SASS_LIBSASS_PATH=/usr/local/libsass-$VERSION make BUILD=static -C /usr/local/sassc-$VERSION \
&& cp /usr/local/sassc-$VERSION/bin/sassc /usr/local/bin/sassc \
&& rm -rf /usr/local/libsass-$VERSION /usr/local/sassc-$VERSION \

# Clean up
&& rm -rf /var/cache/apk/* \
&& apk del curl g++ make
