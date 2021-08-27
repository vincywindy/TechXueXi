#!/bin/sh
./run.sh >> /dev/console 2>&1 &
echo "30 9 * * * /xuexi/run.sh >> /dev/console 2>&1\n#empty line" > /etc/cron.d/mycron
crontab /etc/cron.d/mycron
cron -f
