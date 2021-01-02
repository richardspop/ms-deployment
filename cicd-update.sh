#!/bin/sh

if [[ $1 == *"monitor-sender"* ]]; then
	sed -Ei "s|MONITOR_SENDER_IMAGE=.*|MONITOR_SENDER_IMAGE=$1|g" deploy.sh
elif [[ $1 == *"receiver-logger"* ]]; then
	sed -Ei "s|RECEIVER_LOGGER_IMAGE=.*|RECEIVER_LOGGER_IMAGE=$1|g" deploy.sh
else
	echo "Error: Invalid Image tag"
	exit -1
fi

git add .
git commit -m "$1"
git push origin HEAD:main
