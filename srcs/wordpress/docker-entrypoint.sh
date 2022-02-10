#!/bin/sh

sleep 8
# Create the Wordpress users
if ! [ -f /var/www/html/.wp-ok ]
then
	wp core install --url=vfurmane.42.fr --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --path=/var/www/html
	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD --porcelain --path=/var/www/html
	touch /var/www/html/.wp-ok
fi

exec "$@"
