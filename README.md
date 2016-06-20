# sassc docker image

This is a minimal [docker](https://www.docker.com/) image containing the
[SassC](https://github.com/sass/sassc) binary.

## Versions

* 3.3.6, latest

## Usage

```sh
$ docker run -v $(pwd):/files ubuntudesign/sassc /files/styles.scss > styles.css
```

## Lineage

This image is a fork of [ustwo/docker-sass](https://github.com/ustwo/docker-sass)
and makes use of:

- [docker](https://www.docker.com/)
- [alpine](https://hub.docker.com/_/alpine/)
- [libsass](http://sass-lang.com/libsass)
- [sassc](https://github.com/sass/sassc)
