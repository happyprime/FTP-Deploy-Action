#!/bin/sh

# "to avoid continuing when errors or undefined variables are present"
set -eu

echo "Starting FTP Deploy"
echo "Connecting"

echo "Uploading files..."
lftp $FTP_METHOD://$FTP_SERVER:$FTP_PORT -u $FTP_USERNAME,$FTP_PASSWORD -e "set ftp:ssl-allow no; mirror -x ^\node_modules/$ -s ^\vendor/$ -x ^\.git/$ --verbose --delete --delete-excluded -R $LOCAL_DIR $REMOTE_DIR; quit"

echo "FTP Deploy Complete"
exit 0
