#!/bin/sh

i=0
while [ $i -lt 30 ]
do
	if mysql --host $WORDPRESS_DB_HOST --user $WORDPRESS_DB_USER --password=$WORDPRESS_DB_PASSWORD
	then
		break
	fi
	sleep 1
	i=$(($i + 1))
done
if [ $i -ge 30 ]
then
	exit 1
fi
# Create the Wordpress users
if ! [ -f /var/www/html/.wp-ok ]
then
	wp core install --url=vfurmane.42.fr --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --path=/var/www/html
	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD --porcelain --path=/var/www/html
	wp plugin install redis-cache --activate --path=/var/www/html
	wp redis enable --path=/var/www/html
	touch /var/www/html/.wp-ok
fi
chown -R www-data:www-data /var/www/html

exec "$@"
