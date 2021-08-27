#!/bin/sh
./run.sh > /proc/1/fd/1 &
echo "30 9 * * * /xuexi/run.sh > /proc/1/fd/1\n#empty line" > /etc/cron.d/mycron
crontab /etc/cron.d/mycron
cron -f
