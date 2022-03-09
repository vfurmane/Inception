FROM alpine:3.14.3

ENV TZ=Europe/Paris
RUN set -eux; \
	apk add --no-cache tzdata; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -eux; \
	apk add --no-cache libc6-compat

RUN set -eux; \
	mkdir -p /etc/grafana; \
	mkdir -p /usr/share/grafana; \
	wget https://dl.grafana.com/oss/release/grafana-8.4.3.linux-amd64.tar.gz; \
	tar -zxvf grafana-8.4.3.linux-amd64.tar.gz --strip-components=1 -C /usr/share/grafana; \
	cp /usr/share/grafana/bin/grafana-server /bin; \
	cp "/usr/share/grafana/conf/sample.ini" "/etc/grafana/grafana.ini"; \
    cp "/usr/share/grafana/conf/ldap.toml" /etc/grafana/ldap.toml

COPY docker-entrypoint.sh .

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini", "cfg:default.paths.data=/var/lib/grafana", "web"]
