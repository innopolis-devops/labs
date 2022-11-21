# syntax=docker/dockerfile:1
FROM php:7.4-apache
COPY index.php healthz.php healthcheck.php composer.json engine.php metrics.php visits.php /var/www/html/
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN apt update
RUN apt install -y memcached libz-dev libmemcached-dev
RUN apt install unzip
RUN apt install -y redis-server
RUN pecl install memcached && docker-php-ext-enable memcached
RUN pecl install redis && docker-php-ext-enable redis
RUN cd /var/www/html && composer install
RUN mkdir persistent && touch persistent/visits && chmod 666 persistent/visits
RUN useradd -ms /bin/bash app && chown -R app .
ENV APP_TMP_DATA=/tmp
CMD service memcached start; service apache2 start; redis-server

HEALTHCHECK --interval=1m --timeout=5s \
  CMD curl http://127.0.0.1:80/ || exit 1
