FROM php:7.4-fpm-alpine

RUN apk add --update zlib-dev freetype-dev libpng-dev jpeg-dev libjpeg-turbo-dev postgresql-dev libpng-dev libxml2-dev libzip-dev bzip2-dev shadow $PHPIZE_DEPS

RUN docker-php-ext-configure \
    opcache --enable-opcache &&\
    docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql &&\
    docker-php-ext-configure zip && \
    docker-php-ext-install \
    opcache \
    pdo_pgsql \
    pdo_mysql \
    pgsql \
    pdo \
    sockets \
    intl \
    gd \
    xml \
    bz2 \
    pcntl \
    bcmath \
    exif

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY /8.0/opcache.ini $PHP_INI_DIR/conf.d/
COPY /8.0/php.ini $PHP_INI_DIR/conf.d/

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

USER www-data