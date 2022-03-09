FROM alpine:3.14.3

ENV TZ=Europe/Paris
RUN set -eux; \
	apk add --no-cache tzdata; \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -eux; \
	apk add --no-cache nodejs npm

WORKDIR /usr/src
COPY site/package*.json ./
RUN npm install

COPY docker-entrypoint.sh .
COPY site/. .

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["npm", "run", "dev"]
