# ai_sqa_serve
FROM python:3.9.0

RUN pip install cryptography peewee Flask gensim numpy flask-cors

WORKDIR /home

EXPOSE 5000

CMD ["sh", "/home/run.sh"]