#!/bin/bash

set -e

folder="backups"
password=$(sed -rn 's|.*mysql.*://.+:(.+)\@.*|\1|p' config/config.py)
filename="backup-$(date +%d-%m-%Y).sql.gz"
mkdir -p $folder
mysqldump -u frt -p"$password" frt_data | gzip > "$folder/$filename"
