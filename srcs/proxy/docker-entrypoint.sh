#!/bin/sh


sed -i "s/login\.42\.fr/$DOMAIN_NAME/g" /etc/nginx/http.d/default.conf
mkdir -p /etc/nginx/$DOMAIN_NAME
cd /etc/nginx/$DOMAIN_NAME
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out /etc/nginx/$DOMAIN_NAME/server.key
chmod 400 server.key
openssl req -new -subj "/C=FR/ST=Paris/L=Paris/O=Dis/CN=$DOMAIN_NAME" -sha256 -key server.key -out /etc/nginx/$DOMAIN_NAME/server.csr
openssl x509 -req -days 1095 -in server.csr -signkey /etc/nginx/$DOMAIN_NAME/server.key -out /etc/nginx/$DOMAIN_NAME/server.crt;
mkdir -p /etc/nginx/adminer.$DOMAIN_NAME
cd /etc/nginx/adminer.$DOMAIN_NAME
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out /etc/nginx/adminer.$DOMAIN_NAME/server.key
chmod 400 server.key
openssl req -new -subj "/C=FR/ST=Paris/L=Paris/O=Dis/CN=adminer.$DOMAIN_NAME" -sha256 -key server.key -out /etc/nginx/adminer.$DOMAIN_NAME/server.csr
openssl x509 -req -days 1095 -in server.csr -signkey /etc/nginx/adminer.$DOMAIN_NAME/server.key -out /etc/nginx/adminer.$DOMAIN_NAME/server.crt;
mkdir -p /etc/nginx/grafana.$DOMAIN_NAME
cd /etc/nginx/grafana.$DOMAIN_NAME
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out /etc/nginx/grafana.$DOMAIN_NAME/server.key
chmod 400 server.key
openssl req -new -subj "/C=FR/ST=Paris/L=Paris/O=Dis/CN=grafana.$DOMAIN_NAME" -sha256 -key server.key -out /etc/nginx/grafana.$DOMAIN_NAME/server.csr
openssl x509 -req -days 1095 -in server.csr -signkey /etc/nginx/grafana.$DOMAIN_NAME/server.key -out /etc/nginx/grafana.$DOMAIN_NAME/server.crt;

echo "Starting NGINX..."
exec "$@"
