FROM docker.io/php:8.1-fpm-alpine

COPY --from=docker.io/mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions gd \
    opcache \
    pgsql \
    zip \
    redis \
    pdo_pgsql \
    pdo_mysql \
    sockets \
    bz2 \
    pcntl \
    bcmath \
    rdkafka \
    sqlsrv \
    pdo_sqlsrv \
    exif

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY /8.1/opcache.ini $PHP_INI_DIR/conf.d/
COPY /8.1/php.ini $PHP_INI_DIR/conf.d/
