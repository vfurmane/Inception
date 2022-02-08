#!/bin/sh

if [ -z $MARIADB_USER ] || [ -z $MARIADB_PASSWORD ] || [ -z $MARIADB_DATABASE ]
then
	printf "Missing parameter(s)...\n"
	printf "Please provide MARIADB_USER, MARIADB_PASSWORD and MARIADB_DATABASE\n"
	exit 1
fi

mkdir -p /run/mysqld
touch /run/mysqld/mysqld.sock
if ! [ -d /var/lib/mysql/mysql ]
then
	MARIADB_ROOT_PASSWORD=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 13 ; echo)
	printf 'The root password is: %s\n' "$MARIADB_ROOT_PASSWORD"

	mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	
	# Start temp server
	"$@" &
	mariadb_process=$!
	i=20
	while [ $i -gt 0 ]
	do
		if mysql -u root --database=mysql << EOSQL
SELECT 1;
EOSQL
		then
			break;
		fi
		i=$(($i - 1))
		sleep 1
	done
	[ $i -eq 0 ] && exit 1
	
	mysql -u root << EOSQL
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
CREATE DATABASE $MARIADB_DATABASE;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';
FLUSH PRIVILEGES;
EOSQL
	
	# Stop temp server
	kill $mariadb_process
fi	

echo "Starting Mariadb..."
exec "$@"
