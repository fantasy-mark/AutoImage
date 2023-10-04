# flask_wsgi
FROM ubuntu:22.04
 
RUN mkdir /app
 
COPY main.py /app
COPY uwsgi.ini /app
COPY requirements.txt /app

WORKDIR /app

RUN apt-get update -yqq

# uwsgi-plugin-python3 这是在uwsgi中运行python程序的一个插件
RUN apt-get install python3 python3-pip nginx-core nginx -y

# 设置时区
RUN DEBIAN_FRONTEND="noninteractive" apt -y install tzdata
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 将nginx的配置文件拷贝到/etc/nginx下
COPY nginx.conf /etc/nginx/nginx.conf
 
# nginx运行是需要有用户名的，默认安装好nginx后就有用户名www-data，如果想用其他用户可以使用如下代码增加组和用户
# RUN  groupadd www-data && useradd -G www-data www-data
 
# 对pip进行升级
RUN python3 -m pip install --upgrade pip
 
# 安装运行python所需要的包
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["sh", "/app/run.sh"]