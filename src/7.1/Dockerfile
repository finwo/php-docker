#include <common/alpine>
#include <common/phpvm>

# Setup PHP
RUN phpvm use 7.1.33 --install-dependencies
RUN rm -rf /usr/src/phpvm

#include <common/configs>
#include <common/user>
#include <common/composer>
#include <common/php-fpm>
