FROM php:8.1-apache

WORKDIR /var/www/html
COPY composer.json .
RUN apt-get update && apt-get install -y libzip-dev zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . .

RUN composer install --ignore-platform-reqs

CMD ["apache2-foreground"]  # Start the Apache server
