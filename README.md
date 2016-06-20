# [sassc docker image](https://hub.docker.com/r/ubuntudesign/sassc/)

This is a tiny (4MB) [docker](https://www.docker.com/) image containing the [SassC](https://github.com/sass/sassc) binary.

## Usage

To compile a sass file at `/local-sass-dir/styles.scss` into a file called `styles.css` in the current directory:

``` sh
$ docker run --volume=/local-sass-dir:/sass ubuntudesign/sassc /sass/styles.scss > styles.css
```

To see what other `sassc` options are available:

``` sh
$ docker run ubuntudesign/sassc --help
```

---

With ♥ from [Canonical](http://www.canonical.com).

*Credits: This image is a fork of [ustwo/docker-sass](https://github.com/ustwo/docker-sass) and makes use of [docker](https://www.docker.com/), [alpine](https://hub.docker.com/_/alpine/), [libsass](http://sass-lang.com/libsass) and [sassc](https://github.com/sass/sassc).*

