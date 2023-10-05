# ai_sqa_server
FROM ubuntu:22.04

MAINTAINER Mark Huang <hacker.do@163.com>

WORKDIR /app

RUN apt-get update -yqq

RUN apt-get install python3 python3-pip cron -y

# 设置时区
RUN DEBIAN_FRONTEND="noninteractive" apt -y install tzdata
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 对pip进行升级
RUN python3 -m pip install --upgrade pip
RUN pip install click pandas torch transformers peewee

COPY daily-cron /etc/cron.d/daily-cron
RUN chmod 0644 /etc/cron.d/daily-cron
RUN crontab /etc/cron.d/daily-cron
RUN touch /var/log/cron.log

CMD service cron start && tail -f /var/log/cron.log