#!/bin/bash

NC="\033[0m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"

fatal_error()
{
	printf "${RED}$@${NC}\n"
	exit 1
}

# Starting a temporary mysql server

mysqld &

for i in {30..0}
do
	if mysql -e 'SELECT 1' > /dev/null 2>&1
	then
		break
	fi
	sleep 1
done
if [ "$i" = 0 ]
then
	fatal_error "MySQL daemon timed out. Aborting..."
fi

mysql -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

sed -Ei 's/^bind-address/# bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

exec "$@"
