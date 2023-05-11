FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
        libpng-dev \
        libjpeg-dev \
        libmcrypt-dev \
        libzip-dev \
        zip \
        unzip \
        curl \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd mysqli pdo_mysql zip \
    && pecl install mcrypt-1.0.4 \
    && docker-php-ext-enable mcrypt

RUN a2enmod rewrite

COPY ./wordpress/ /var/www/html/
