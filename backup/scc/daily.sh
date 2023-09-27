#!/bin/bash

cd /work

echo "-----" >> /var/daily.log
date >> /var/daily.log
/usr/local/bin/scc update >> /var/daily.log 2>&1