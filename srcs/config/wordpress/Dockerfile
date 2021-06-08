# vvv  Change that  vvv
FROM php:fpm

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends curl \
												ca-certificates

WORKDIR /usr/src

RUN set -eux; \
	version=5.7.2; \
	curl -fLsS -o wordpress.tar.gz https://wordpress.org/wordpress-${version}.tar.gz; \
	mkdir -p /var/www/html; \
	tar -xzf wordpress.tar.gz -C /var/www/html; \
	rm wordpress.tar.gz;

COPY docker-entrypoint.sh .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD [ "php-fpm" ]
