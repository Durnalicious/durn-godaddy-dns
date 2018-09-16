#! /bin/sh

godaddy-dns -c /config/config.json -i /var/.lastip >> /dev/stdout
