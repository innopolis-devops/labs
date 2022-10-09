FROM trafex/php-nginx:2.6.0

LABEL \
    maintainer="Vladimir Markov <Markovvn1@gmail.com>" \
    description="Web application that helps you to count rabbits"

RUN rm -rf /var/www/html/*

COPY docker_files/nginx.conf /etc/nginx/nginx.conf
COPY site/ /var/www/html/

EXPOSE 80

HEALTHCHECK --interval=5s --timeout=10s CMD curl --silent --fail http://127.0.0.1/fpm-ping || exit 1
