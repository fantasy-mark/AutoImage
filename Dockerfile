# ai_sqa_annota
FROM ubuntu:22.04

MAINTAINER Mark Huang <hacker.do@163.com>

WORKDIR /app

CMD service cron start && tail -f /var/log/cron.log