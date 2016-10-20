#!/bin/bash

CURRENT_STATE=

while true 
do 


NEW_STATE=$(curl -s -i -H "Accept: application/vnd.travis-ci.2+json" "https://api.travis-ci.org/repos/HPI-SWA-Teaching/PrettyPrettyPrint/builds" | grep -o '"state":.[a-z\"]*' | head -1)

if [ "$CURRENT_STATE" != "$NEW_STATE" ]
then
	echo "state changed, changing profile picture to" $NEW_STATE
	CURRENT_STATE=$NEW_STATE

	if [ "$NEW_STATE"="\"{state}\":\"passed\"" ]
	then tg/bin/telegram-cli -W -e "chat_set_photo Test ./rotesAmpelmann.png"
	else tg/bin/telegram-cli -W -e "chat_set_photo Test ./gruenesAmpelmann.png"
	fi
fi

sleep 1m
done
