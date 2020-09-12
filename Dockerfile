FROM php:7.4-fpm-alpine3.11
WORKDIR "/project"

RUN apk update \
    && apk add --no-cache php7-dev zlib-dev libzip libzip-dev libpng libpng-dev oniguruma-dev libmcrypt libmcrypt-dev gcc make autoconf libc-dev php-pear libmemcached libmemcached-dev \
    && docker-php-ext-install gd mbstring mysqli pdo_mysql zip \
    && pecl install mcrypt-1.0.3 && docker-php-ext-enable mcrypt \
    && pecl install memcached-3.1.5 && docker-php-ext-enable memcached \
    && apk del php7-dev zlib-dev libzip-dev libpng-dev oniguruma-dev libmcrypt-dev gcc make autoconf libc-dev php-pear libmemcached-dev
