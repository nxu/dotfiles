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

# Receptek
docker compose -f /root/compose.yaml stop web_recipes
docker compose -f /root/compose.yaml stop db_recipes
cp -r /root/docker-volumes/tandoor "${BACKUP_ID}/tandoor"
docker compose -f /root/compose.yaml start db_recipes
docker compose -f /root/compose.yaml start web_recipes

# Caddyfile
cp /etc/caddy/Caddyfile "${BACKUP_ID}/Caddyfile"

# Local fail2ban config
mkdir "${BACKUP_ID}/fail2ban"
cd /etc/fail2ban
find . -name '*.local' | cpio -pdm "$WORKDIR/${BACKUP_ID}/fail2ban"
cd $WORKDIR || return 1

# Backup script itself
cp "/root/backup.sh" "${BACKUP_ID}/backup.sh"

# Compress everything
tar -zcvf "${BACKUP_ID}.tar.gz" $BACKUP_ID >/dev/null 2>&1

# Delete source folder
rm -rf $BACKUP_ID

# Delete old backups
for old_backup in $(ls /root/backup/|grep "^[0-9\-]*$"|sort -nr|sed "1,3 d")
do
	echo "Deleting folder: $old_backup"
  rm -rf "/root/backup/$old_backup" || true

  echo "Deleting archive: $old_backup.tar.gz"
  rm -rf "/root/backup/$old_backup.tar.gz" || true
done