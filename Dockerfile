FROM php:7.4-apache

RUN apt update && apt upgrade -y
RUN docker-php-ext-install mysqli && \
  docker-php-ext-enable mysqli
RUN apt clean

EXPOSE 8080
EXPOSE 80

WORKDIR /var/www/html

COPY . ./
COPY ./php.ini-production /usr/local/etc/php/conf.d/php.ini

RUN chown -R www-data *
RUN rm -rf docker && rm testlink_user_conf.sql

RUN cat ./apache/ports.conf > /etc/apache2/ports.conf
RUN mkdir -p /var/testlink/logs/ mkdir -p /var/testlink/upload_area/ && chown -R www-data /var/testlink/
