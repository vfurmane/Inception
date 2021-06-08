FROM debian:buster

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends curl \
												ca-certificates \
												php7.3-fpm \
												php7.3-mysqli;

WORKDIR /usr/src

RUN set -eux; \
	version=5.7.2; \
	curl -fLsS -o wordpress.tar.gz https://wordpress.org/wordpress-${version}.tar.gz; \
	mkdir -p /var/www/html; \
	tar -xzf wordpress.tar.gz -C /var/www/html; \
	rm wordpress.tar.gz;

RUN mkdir -p /run/php

COPY docker-entrypoint.sh .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD [ "php-fpm7.3", "-FR" ]
