FROM debian:buster

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends mariadb-server; \
	mkdir -p /var/run/mysqld; \
	chmod 777 /var/run/mysqld;

WORKDIR /usr/src

COPY docker-entrypoint.sh .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD [ "mysqld" ]
