#!/bin/bash

sed -i "s/listen[[:blank:]]*=[[:blank:]]*.*/listen = 0.0.0.0:9000/" /etc/php/7.3/fpm/pool.d/www.conf

exec "$@"
