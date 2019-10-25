FROM php:7.1.0-apache
RUN docker-php-ext-install mysqli
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev && \
    apt-get install -y libicu-dev g++ \
    && docker-php-ext-configure intl
RUN apt install -y libxml2-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install soap
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install opcache
RUN mkdir /data
RUN chmod 777 /data
COPY ./custom-php.ini /usr/local/etc/php/php.ini

ENV VERSION 1.0
LABEL version=$VERSION
