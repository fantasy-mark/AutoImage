# cofa_ai_serve
FROM python:3.9.0

RUN pip install click cryptography peewee Flask gensim numpy flask-cors xlrd xlwt tqdm

WORKDIR /home

EXPOSE 5000

CMD ["sh", "/home/run.sh"]