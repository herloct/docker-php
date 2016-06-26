FROM php:5.6.23-fpm-alpine

MAINTAINER herloct <herloct@gmail.com>

RUN apk update --no-cache && \
    apk add --no-cache \
        autoconf \
        coreutils \
        freetype-dev \
        icu-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        postgresql-dev \
        zlib-dev

RUN docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ && \
    pecl channel-update pecl.php.net && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-install -j$(nproc) \
        bcmath \
        intl \
        gd \
        opcache \
        pdo_mysql \
        pdo_pgsql \
        zip && \
    rm -rf /var/cache/apk/* /tmp/*

RUN adduser -D php && \
    adduser www-data php && \
    mkdir -p /project && \
    chown -R php:php /home/php /project /var/www/html

VOLUME /project /var/www/html

CMD ["php-fpm"]
