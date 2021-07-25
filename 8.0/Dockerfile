FROM php:8.0-fpm-alpine

# Add Build Dependencies
RUN apk update && apk add --no-cache --virtual .build-deps  \
    zlib-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxml2-dev \
    bzip2-dev \
    postgresql-dev \ 
    zip \
    libzip-dev 

# Add Production Dependencies
RUN apk add --update --no-cache \
    shadow \
    jpegoptim \
    pngquant \
    optipng \
    supervisor \
    nano \
    icu-dev \
    freetype-dev \
    nginx \
    mysql-client

# Configure & Install Extension
RUN docker-php-ext-configure \
    opcache --enable-opcache &&\
    docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql &&\
    docker-php-ext-configure zip && \
    docker-php-ext-install \
    opcache \
    pdo_pgsql \
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

COPY opcache.ini $PHP_INI_DIR/conf.d/
COPY php.ini $PHP_INI_DIR/conf.d/

# Configure nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Remove Build Dependencies
RUN apk del -f .build-deps

# Configure supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /var/www

# change default uid
RUN usermod -u 1000 www-data 
RUN groupmod -g 1000 www-data

RUN chown -R www-data:www-data /var/www && \
  chown -R www-data:www-data /run && \
  chown -R www-data:www-data /var/run && \
  chown -R www-data:www-data /var/lib/nginx && \
  chown -R www-data:www-data /var/log/nginx

RUN touch /var/run/nginx.pid && \
      chown -R www-data:www-data /var/run/nginx.pid

USER www-data

WORKDIR /var/www

VOLUME [ "/var/www" ]

CMD ["/usr/bin/supervisord"]
