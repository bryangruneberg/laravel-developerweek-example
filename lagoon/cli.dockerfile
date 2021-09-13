FROM amazeeio/php:8.0-cli

RUN apk del nodejs-current
RUN apk add --no-cache nodejs
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install exif

#COPY lagoon/php-cli.ini /usr/local/etc/php/php.ini
COPY . /app

RUN mkdir -p /app/storage/framework/{sessions,views,cache}
RUN mkdir -p /app/storage/app/public
RUN COMPOSER_MEMORY_LIMIT=-1 composer install
RUN php artisan storage:link
RUN yarn install
RUN yarn production
RUN wget -O /usr/bin/lagoon https://github.com/uselagoon/lagoon-cli/releases/download/v0.11.6/lagoon-cli-v0.11.6-linux-amd64 && chmod +x /usr/bin/lagoon
RUN wget -O /usr/bin/lagoon-sync https://github.com/amazeeio/lagoon-sync/releases/download/v0.4.6/lagoon-sync_0.4.6_linux_amd64 && chmod +x /usr/bin/lagoon-sync

# ENV APP_ENV=${LAGOON_ENVIRONMENT_TYPE}
ENV WEBROOT=public
ENV PAGER=less
ENV PHP_MEMORY_LIMIT=8192M
