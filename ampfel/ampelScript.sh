#!/bin/bash

CURRENT_STATE="asd"
sispmctl -f 1 -f 2


while true 
do 


NEW_STATE=$(curl -s -LH "Accept: application/vnd.travis-ci.2+json" "https://api.travis-ci.org/repos/HPI-SWA-Lab/BP2016H1/builds" | grep -o '"state":.[a-z\"]*' | head -n 1);

if [ "$CURRENT_STATE" != "$NEW_STATE" ];
then
	CURRENT_STATE=$NEW_STATE;
	if [ $CURRENT_STATE = "\"state\":\"errored\"" ]; then
		sispmctl -o 2 -f 1
	elif [ $CURRENT_STATE = "\"state\":\"passed\"" ]; then
		sispmctl -o 1 -f 2

	else
		sispmctl -f 1 -f 2
	fi
fi

sleep 30s
done
