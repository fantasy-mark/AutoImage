# flask_wsgi
FROM ubuntu:22.04

MAINTAINER Mark Huang <hacker.do@163.com>

WORKDIR /app

RUN apt-get update -yqq

RUN apt-get install python3 python3-pip nginx-core nginx -y

COPY nginx.conf /etc/nginx/conf.d/

# 设置时区
RUN DEBIAN_FRONTEND="noninteractive" apt -y install tzdata
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# nginx运行是需要有用户名的，默认安装好nginx后就有用户名www-data，如果想用其他用户可以使用如下代码增加组和用户
# RUN  groupadd www-data && useradd -G www-data www-data
 
# 对pip进行升级
RUN python3 -m pip install --upgrade pip

# 安装运行python所需要的包
#RUN pip install -r requirements.txt
RUN pip install click cryptography peewee Flask gensim numpy flask-cors xlrd xlwt tqdm werkzeug gunicorn

EXPOSE 8000

CMD ["sh", "/app/run.sh"]