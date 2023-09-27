#!/bin/bash

service cron start
service cron status

echo "0 */3 * * * sh /work/daily.sh" > /etc/cron.d/daily-cron

crontab /etc/cron.d/daily-cron
service cron reload
service cron restart

cd /work
pip install Flask_Cors-4.0.0-py2.py3-none-any.whl
pip install scc-1.1-py3-none-any.whl

echo "svn ls https://10.175.69.139/svn/spring-cloud2x/trunk --username maohao --password F1243749"

sleep 200
scc run