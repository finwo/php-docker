#include <common/alpine>
#include <common/phpvm>

# Setup PHP
RUN phpvm use 7.3.12 --install-dependencies
RUN rm -rf /usr/src/phpvm
RUN rm -rf /var/cache/phpvm

#include <common/configs>
#include <common/user>
#include <common/composer>
#include <common/php-fpm>
