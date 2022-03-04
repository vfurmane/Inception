#!/bin/sh

if ! id $FTP_USER > /dev/null 2>&1
then
	adduser -D $FTP_USER
	passwd $FTP_USER << EOF
$FTP_PASS
$FTP_PASS
EOF
fi

echo "Starting FTP server..."
exec "$@"
