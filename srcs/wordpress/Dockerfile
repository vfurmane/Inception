FROM php:8.1.2-fpm-alpine3.14

ENV TZ=Europe/Paris
RUN set -eux; \
	apk add --no-cache tzdata; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -eux; \
	apk add php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml; \
	apk add --no-cache --virtual .build-deps \
		freetype-dev \
		icu-dev \
		imagemagick-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		libwebp-dev \
		libzip-dev \
	; \
	\
	docker-php-ext-configure gd \
		--with-freetype \
		--with-jpeg \
		--with-webp \
	; \
	docker-php-ext-install \
		bcmath \
		exif \
		gd \
		intl \
		mysqli \
		zip \
	;

RUN set -eux; \
	wget -O wordpress.tar.gz https://wordpress.org/wordpress-5.9.tar.gz; \
	tar -xzf wordpress.tar.gz -C /var/www; \
	rm -rf /var/www/html; \
	mv /var/www/wordpress/ /var/www/html; \
	chown -R www-data:www-data /var/www/html

COPY --chown=www-data:www-data wp-config-sample.php wp-config.php
