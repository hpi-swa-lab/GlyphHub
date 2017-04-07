#!/bin/bash

CURRENT_STATE="asd"
sispmctl -f 1 -f 2
COLOR="red"

while true 
do 


NEW_STATE=$(curl -s -LH "Accept: application/vnd.travis-ci.2+json" "https://api.travis-ci.org/repos/HPI-SWA-Lab/BP2016H1/builds" | grep -oP '{.*?"branch":"master".*?}' | grep -o '"state":.[a-z\"]*' | head -1)

if [ "$CURRENT_STATE" != "$NEW_STATE" ];
then
	CURRENT_STATE=$NEW_STATE;
	if [ $CURRENT_STATE = "\"state\":\"passed\"" ]; then
		sispmctl -o 1 -f 2
		COLOR="green"
#todo: include case for "created" and "started" states
	elif [ $CURRENT_STATE = "\"state\":\"started\"" ] || [ $CURRENT_STATE = "\"state\":\"created\"" ] || [ $CURRENT_STATE = "\"state\":\"starting\"" ] || [ $CURRENT_STATE = "\"state\":\"queued\"" ]; then
		if [$COLOR = "green"]; then
			sispmctl -f 1 -o 2
			COLOR="red"
		else
			sispmctl -o 1 -f 2
			COLOR="green"
		fi
	else
		sispmctl -f 1 -o 2
		COLOR="red"
	fi
fi

sleep 30s
done
