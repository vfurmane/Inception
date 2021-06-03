#!/bin/sh

NC="\033[0m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"

openssl req -x509 -nodes -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/CN=localhost" -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

cp -f cert.pem /etc/nginx/ssl/localhost.crt;
cp -f key.pem /etc/nginx/ssl/localhost.key;

echo "${BLUE}NGINX running...${NC}"
exec "$@"
