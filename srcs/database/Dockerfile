FROM alpine:3.14.3

ENV TZ=Europe/Paris
RUN set -eux; \
	apk add --no-cache tzdata; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -eux; \
	apk add --no-cache mariadb mysql-client; \
	sed -i 's/skip-networking$//' /etc/my.cnf.d/mariadb-server.cnf

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mariadbd", "--user=root"]
