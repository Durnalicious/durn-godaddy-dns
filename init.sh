#! /bin/sh

if [ ! -f /config/config.json  ]
then
	echo "config.json not found. Please edit config.json.sample to your liking, and rename to config.json" && \

	{ if [ ! -f /config/config.json.sample ]
		then
			echo "config.json.sample not found, copying to /config"
			cp /app/config.json.sample /config/config.json.sample
		fi
	}

else
	echo "config.json found."
fi



if [ ! -f /config/crontab  ]
then
        echo "crontab not found. Copying default crontab of every 2 hours, and setting spool." && \
        cp /app/crontab /config/crontab
	rm -f /var/spool/cron/crontabs/root
	cat /config/crontab > /var/spool/cron/crontabs/root
else
        echo "crontab found. Setting spool."
	rm -f /var/spool/cron/crontabs/root
        cat /config/crontab > /var/spool/cron/crontabs/root
fi

echo "Starting cron job"

crond -l 8 -f
