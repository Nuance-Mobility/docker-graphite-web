#!/bin/bash
set -e

if [ -a /var/run/apache2/apache2.pid ]
then 
	rm /var/run/apache2/apache2.pid
fi

if [ "$1" = 'graphiteweb' ]; then
	chmod 777 /graphite_web_init_script.sh
    ./graphite_web_init_script.sh
    exec /usr/sbin/apache2ctl -D FOREGROUND
fi

exec "$@"
