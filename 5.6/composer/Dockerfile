FROM php:5.6.23-alpine

MAINTAINER herloct <herloct@gmail.com>

RUN apk update --no-cache && \
    apk add --no-cache \
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
    mkdir -p /home/php/bin && \
    mkdir -p /project && \
    chown -R php:php /home/php /project

USER php
ENV HOME /home/php

RUN cd /home/php && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/home/php/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

ENV PATH /home/php/bin:$PATH

VOLUME /project
WORKDIR /project

ENTRYPOINT ["composer"]
CMD ["list"]
