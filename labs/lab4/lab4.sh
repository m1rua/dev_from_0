#!/bin/bash

curl -f -s "$1" > /dev/null

if [ $? -eq 0 ]; then
	echo "server is ok"
	exit 0
else
	echo "server is not ok"
	exit 1
fi
