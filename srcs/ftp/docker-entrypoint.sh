#!/bin/sh

if ! id $FTP_USER > /dev/null 2>&1
then
	delgroup www-data
	adduser -u 82 -g 82 -D $FTP_USER
	passwd $FTP_USER << EOF
$FTP_PASS
$FTP_PASS
EOF
fi

echo "Starting FTP server..."
exec "$@"
