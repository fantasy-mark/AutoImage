# jupyter_notebook
FROM python:3.9.0

RUN pip install click tqdm cryptography peewee Flask xlwt xlrd gensim numpy flask-cors

WORKDIR /home

<<<<<<< HEAD
EXPOSE 5000

CMD ["sh", "/home/run.sh"]
=======
RUN apt-get install build-essential pkg-config zlib1g-dev libglib2.0-0 libglib2.0-dev  libsdl1.2-dev libpixman-1-dev libfdt-dev libssl-dev autoconf automake libtool librbd-dev libaio-dev flex bison bc vim -y
RUN apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf -y
RUN apt-get install qemu-system -y

EXPOSE 8888

CMD ["/bin/bash", "-c", "/project/start.sh"]
>>>>>>> 131e3e806713d9ea29ece6f543d96fb698fc99df
