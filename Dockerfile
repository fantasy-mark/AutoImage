# ai_annota
FROM ubuntu:22.04

RUN apt-get update && apt-get install cron -y && apt-get install python3 python3-pip -y && 

RUN pip install click cryptography peewee Flask numpy pandas flask-cors tqdm torch transformers tqdm

WORKDIR /home

EXPOSE 5000

CMD ["sh", "/home/run.sh"]