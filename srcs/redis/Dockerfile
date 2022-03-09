FROM alpine:3.14

RUN set -eux; \
	apk add --no-cache redis

COPY docker-entrypoint.sh .

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["redis-server", "--protected-mode", "no"]
