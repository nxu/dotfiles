#!/usr/bin/env bash

# Config
WORKDIR=/root/backup

# Initialize script
BACKUP_ID="$1"
if [ -z "$1" ] 
then
  DATE=$(date +%Y-%m-%d-%H%M%S)
  BACKUP_ID="${DATE}"
fi

cd $WORKDIR || return 1
mkdir $BACKUP_ID

# Penz.nxu.hu
tar -zcvf "${BACKUP_ID}/penz.tar.gz" "/var/www/penz/shared/database/" >/dev/null 2>&1

# Caddyfile
cp /etc/caddy/Caddyfile "${BACKUP_ID}/Caddyfile"

# Backup script itself
cp "/root/backup.sh" "${BACKUP_ID}/backup.sh"

# Compress everything
tar -zcvf "${BACKUP_ID}.tar.gz" $BACKUP_ID >/dev/null 2>&1


