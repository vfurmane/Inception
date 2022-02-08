FROM alpine:3.14.0

ENV TZ=Europe/Paris
RUN set -eux; \
	apk add --no-cache tzdata; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -eux; \
	apk add --no-cache openssl ca-certificates nginx; \
	ln -sf /dev/stdout /var/log/nginx/access.log; \
	ln -sf /dev/stder /var/log/nginx/error.log;

COPY docker-entrypoint.sh /
COPY default.conf /etc/nginx/http.d/default.conf
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
