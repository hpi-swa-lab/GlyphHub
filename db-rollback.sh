set -e

FILE=$1
if [ ! -f "$FILE"  ]; then
  echo "$FILE does not exist"
    exit 1
fi

read -p "Create a database backup before resetting? (y/n) "
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$  ]]
then
  echo "creating backup.."
  /bin/bash db-backup.sh "$HOME/emergency_backups"
fi

root_mysql_pw=$(sudo cat /root/.mysql_root_pw)
mysql -u root -p"$root_mysql_pw" < create_database.sql

password=$(sed -rn 's|.*mysql.*://.+:(.+)\@.*|\1|p' config/config.py)
gzip -cd "$FILE" | mysql -u frt -p"$password" frt_data
