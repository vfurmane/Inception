FROM debian:buster

EXPOSE 80
EXPOSE 443

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends nginx \
												openssl;

WORKDIR /usr/src
COPY ./ ./

RUN set -eux; \
	cp -f sites-available/default /etc/nginx/sites-available/default; \
	ln -fs /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default; \
	mkdir -p /etc/nginx/ssl;

ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
