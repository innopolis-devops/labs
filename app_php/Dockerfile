# syntax=docker/dockerfile:1
FROM php:7.4-apache
COPY index.php /var/www/html
RUN useradd -ms /bin/bash app && chown -R app .
USER app
ENV APP_TMP_DATA=/tmp
