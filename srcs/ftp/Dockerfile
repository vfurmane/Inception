FROM alpine:3.14.3

ENV TZ=Europe/Paris
RUN set -eux; \
	apk add --no-cache tzdata; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -eux; \
	apk add --no-cache vsftpd

COPY docker-entrypoint.sh .
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
