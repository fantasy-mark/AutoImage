# ai_annota
FROM python:3.9.0

RUN pip install click cryptography peewee Flask numpy pandas flask-cors tqdm torch transformers tqdm cron

WORKDIR /home

EXPOSE 5000

CMD ["sh", "/home/run.sh"]