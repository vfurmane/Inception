#!/bin/bash

sed -Ei 's/listen = \/run\/php\/php7\.3-fpm\.sock/listen = 127.0.0.1:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

exec "$@"
