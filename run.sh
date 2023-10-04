#!/bin/bash
set -e
pwd

touch /var/jenkins_home/workspace/log/access_print.log
touch /var/jenkins_home/workspace/log/error_print.log
touch /var/jenkins_home/workspace/log/output_print.log
pwd
ls -l
echo makedir ok 
chmod 777 src

exec gunicorn main:app \
        --bind 0.0.0.0:8000 \
        --workers 4 \
        --log-level debug \
        --access-logfile=/var/jenkins_home/workspace/log/access_print.log \
        --error-logfile=/var/jenkins_home/workspace/log/error_print.log
exec "$@"
 