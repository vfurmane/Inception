#!/bin/sh

mkdir -p /etc/nginx/vfurmane.42.fr
cd /etc/nginx/vfurmane.42.fr
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out /etc/nginx/vfurmane.42.fr/server.key
chmod 400 server.key
openssl req -new -subj "/C=FR/ST=Paris/L=Paris/O=Dis/CN=vfurmane.42.fr" -sha256 -key server.key -out /etc/nginx/vfurmane.42.fr/server.csr
openssl x509 -req -days 1095 -in server.csr -signkey /etc/nginx/vfurmane.42.fr/server.key -out /etc/nginx/vfurmane.42.fr/server.crt;

echo "Starting NGINX..."
exec "$@"
