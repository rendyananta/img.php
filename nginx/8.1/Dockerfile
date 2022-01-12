FROM docker.io/php:8.1-fpm-alpine

COPY --from=docker.io/mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN apk update && apk add --no-cache supervisor nginx

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

COPY --from=docker.io/composer:2 /usr/bin/composer /usr/bin/composer

COPY /nginx/8.1/opcache.ini $PHP_INI_DIR/conf.d/
COPY /nginx/8.1/php.ini $PHP_INI_DIR/conf.d/

COPY /nginx/8.1/supervisord.conf /etc/supervisord.conf
COPY /nginx/8.1/nginx.conf /etc/nginx/nginx.conf

RUN touch /var/run/nginx.pid && \
        chown -R www-data:www-data /var/run/nginx.pid

EXPOSE 8000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]