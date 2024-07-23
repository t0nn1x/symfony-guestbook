FROM php:8-fpm

RUN apt-get update && apt-get install -y libpq-dev libicu-dev \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql intl \
    && echo 'extension=intl.so' > /usr/local/etc/php/conf.d/docker-php-ext-intl.ini

# Copy application code (assuming your application is in the same directory as the Dockerfile)
COPY . /var/www/html

# Set working directory
WORKDIR /var/www/html
