#!/bin/bash

cd /app

echo "-----" >> /var/daily.log
date >> /var/daily.log
/usr/local/bin/sqa_annota pred --docs "test predict" >> /var/daily.log 2>&1