FROM alpine:3.14.3

ENV TZ=Europe/Paris
RUN set -eux; \
	apk add --no-cache tzdata; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -eux; \
	apk add --no-cache php php-fpm php-common php-phar php-session php-curl php-dom php-exif php-fileinfo php-json php-mbstring php-mysqli php-openssl php7-pecl-imagick php-xml php-zip; \
	adduser -u 82 -D -S -G www-data www-data; \
	sed -i 's/listen = 127\.0\.0\.1:9000/listen = 0.0.0.0:9000/g' /etc/php7/php-fpm.d/www.conf; \
	sed -i 's/;clear_env = no/clear_env = no/g' /etc/php7/php-fpm.d/www.conf; \
	sed -i 's/user = nobody/user = www-data/g' /etc/php7/php-fpm.d/www.conf; \
	sed -i 's/group = nobody/group = www-data/g' /etc/php7/php-fpm.d/www.conf

RUN set -eux; \
	mkdir -p /var/www/html; \
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php; \
	mv adminer-4.8.1-mysql.php /var/www/html/index.php

COPY docker-entrypoint.sh .

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["php-fpm7", "-F"]
