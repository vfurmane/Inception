FROM debian:buster

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends nginx;

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
