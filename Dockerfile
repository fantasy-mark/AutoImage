FROM ubuntu:22.04
RUN apt-get update && apt-get install cron -y && apt-get install python3 -y && apt-get install python3-pip -y && apt-get install git
WORKDIR /work

CMD ["sh", "run.sh"]