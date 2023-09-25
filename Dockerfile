# jupyter_notebook
FROM python:3.9.0

RUN pip install click tqdm cryptography peewee Flask xlwt xlrd gensim numpy flask-cors

WORKDIR /home

EXPOSE 5000

CMD ["sh", "/home/run.sh"]