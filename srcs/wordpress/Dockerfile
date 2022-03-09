FROM alpine:3.14

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
	mkdir -p /var/www; \
	wget -O wordpress.tar.gz https://wordpress.org/wordpress-5.9.1.tar.gz; \
	tar -xzf wordpress.tar.gz -C /var/www; \
	mv /var/www/wordpress/ /var/www/html; \
	chown -R www-data:www-data /var/www/html

COPY --chown=www-data:www-data wp-config-sample.php /var/www/html/wp-config.php
# COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY docker-entrypoint.sh .

RUN set -eux; \
	wget https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["php-fpm7", "-F"]
