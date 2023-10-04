# flask_wsgi
FROM ubuntu:22.04
 
RUN mkdir /app
 
COPY main.py /app
COPY uwsgi.ini /app
COPY requirements.txt /app
 
RUN apt-get update -yqq
 
# uwsgi-plugin-python3 这是在uwsgi中运行python程序的一个插件
RUN apt-get install python3 python3-pip python3-venv nginx-core nginx -y

# 时区设置
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo 'Asia/Shanghai' >/etc/timezone
 
# 将nginx的配置文件拷贝到/etc/nginx下
COPY nginx.conf /etc/nginx/nginx.conf
 
# nginx运行是需要有用户名的，默认安装好nginx后就有用户名www-data，如果想用其他用户可以使用如下代码增加组和用户
# RUN  groupadd www-data && useradd -G www-data www-data

# Python一般是在虚拟环境下运行了，下面三步是用于创建虚拟环境：
# 第一步：定义虚拟环境的名称
ENV VIRTUAL_ENV=venv
 
# 第二步：生成虚拟环境
RUN python3 -m venv venv
 
# 第三步：最关键，它会激活虚拟环境，这是英文说明：The most important part is setting PATH: PATH is a list of directories which are searched for commands to run. activate simply adds the virtualenv’s bin/ directory to the start of the list.
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
 
# 对pip进行升级
RUN python3 -m pip install --upgrade pip
 
# 安装运行python所需要的包
RUN pip3 install -r requirements.txt

WORKDIR /app

EXPOSE 5000

CMD ["sh", "/app/run.sh"]