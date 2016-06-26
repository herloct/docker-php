[Docker](http://www.docker.com/) image for [PHP](http://php.net).

## What's Inside

This image is based on [official PHP image](https://hub.docker.com/_/php/),
using Alpine Linux instead of Debian for smaller size.

* PHP CLI, FPM, and Composer
* Commonly installed PHP Extensions

```
[PHP Modules]
bcmath*
Core
ctype
curl
date
dom
fileinfo
filter
gd*
hash
iconv
intl*
json
libxml
mbstring
mysqlnd
openssl
pcre
PDO
pdo_mysql*
pdo_sqlite
pdo_pgsql*
Phar
posix
readline
Reflection
session
SimpleXML
SPL
sqlite3
standard
tokenizer
xml
xmlreader
xmlwriter
Zend OPcache*
zip*
zlib

[Zend Modules]
Xdebug*
Zend OPcache*

*) Extension added by this image
```

## Supported tags and respective `Dockerfile` links

* [`7.0.8-cli`, `7.0-cli`, `cli`, `latest`](https://github.com/herloct/docker-php/blob/master/7.0/Dockerfile)
* [`7.0.8-fpm`, `7.0-fpm`, `fpm`](https://github.com/herloct/docker-php/blob/master/7.0/fpm/Dockerfile)
* [`7.0.8-composer`, `7.0-composer`, `composer`](https://github.com/herloct/docker-php/blob/master/7.0/composer/Dockerfile)
* [`5.6.23-cli`, `5.6-cli`](https://github.com/herloct/docker-php/blob/master/5.6/Dockerfile)
* [`5.6.23-fpm`, `5.6-fpm`](https://github.com/herloct/docker-php/blob/master/5.6/fpm/Dockerfile)
* [`5.6.23-composer`, `5.6-composer`](https://github.com/herloct/docker-php/blob/master/5.6/composer/Dockerfile)

## How to use this image

Basic usage

```sh
docker run --rm -v /local/path:/project herloct/php [<options>]
```

For example, to show PHP's version

```sh
docker run --rm -v /local/path:/project herloct/php -v
```

To run a single PHP script

```sh
docker run --rm -v /local/path:/project herloct/php some_script.php
```

Or, you can use [Docker Compose](https://docs.docker.com/compose/)'s `docker-compose.yml`

```yaml
php:
    image: herloct/php
    volumes:
        - /local/path:/project
```

And run it via

```sh
docker-compose run php [<options>]
```
