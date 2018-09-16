#! /bin/sh

if [ ! -f /config/config.json  ]:
then
	echo "config.json not found. Copying config.json.sample" && \
	cp /app/config.json.sample /config/config.json.sample
else
	echo "config.json found" && exit 0
fi

if [ ! -f /config/crontab  ]:
then
        echo "crontab not found. Copying crontab" && \
        cp /app/crontab /config/crontab
else
        echo "crontab found" && exit 0
fi

crond -f
