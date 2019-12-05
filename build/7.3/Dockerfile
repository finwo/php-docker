FROM alpine:edge

ENV TERM=ansi

RUN echo "" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main"      >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing"   >> /etc/apk/repositories

# Update all packages & install bash/curl
RUN apk update
RUN apk upgrade
RUN apk add bash curl
# Install phpvm
RUN curl -sL https://finwo.github.io/phpvm/install.sh | bash /dev/stdin --prefix /usr
RUN mkdir -p /var/log/php

# Setup PHP
RUN phpvm use 7.3.12 --install-dependencies
RUN rm -rf /usr/src/phpvm
RUN rm -rf /var/cache/phpvm

# Copy configs
COPY config/php.ini      /usr/local/etc/php/conf.d/10-defaults.ini
COPY config/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY config/php-fpm.d    /usr/local/etc/php-fpm.d
# User to run as
# www-data should normally be 82
# for development environments with mounts 1000 was chosen instead
RUN addgroup -S -g 33 www-data
RUN adduser -SD -u 33 -G www-data www-data
# Setup composer (useful to have around)
RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer.phar
RUN ln -s /usr/bin/composer.phar /usr/bin/composer
EXPOSE 9000
CMD /usr/local/sbin/php-fpm -F
