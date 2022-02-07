FROM mariadb:10.7.1-focal

ENV TZ=Europe/Paris
RUN set -eux; \
#	apk add --no-cache tzdata; \ # For Alpine
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
