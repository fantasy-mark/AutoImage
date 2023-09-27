# flask_wsgi
FROM ubuntu:22.04
 
RUN mkdir /app
 
COPY main.py /app
COPY uwsgi.ini /app
 
WORKDIR /app
 
RUN apt-get update -yqq
 
# uwsgi-plugin-python3 这是在uwsgi中运行python程序的一个插件
RUN apt-get install python3 python3-pip python3-venv nginx-core nginx uwsgi uwsgi-plugin-python3 -y
 
# 将nginx的配置文件拷贝到/etc/nginx下
COPY nginx.conf /etc/nginx/nginx.conf
 
# 添加证书文件
COPY cert /etc/nginx/cert
 
# nginx运行是需要有用户名的，默认安装好nginx后就有用户名www-data，如果想用其他用户可以使用如下代码增加组和用户
# RUN  groupadd www-data && useradd -G www-data www-data
 
# Python一般是在虚拟环境下运行了，下面三步是用于创建虚拟环境：
# 第一步：定义虚拟环境的名称
ENV VIRTUAL_ENV=venv
 
# 第二步：生成虚拟环境
RUN python3 -m venv venv
 
# 第三步：最关键，它会激活虚拟环境，这是英文说明：The most important part is setting PATH: PATH is a list of directories which are searched for commands to run. activate simply adds the virtualenv’s bin/ directory to the start of the list.
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
 
# 因为docker image是分层的，每一行的Run命令就是一层，同时也是不同的进程，所以像如下设置虚拟环境，是没用的。
# RUN source venv/bin/activate
# ubuntu 默认使用得是/bin/sh, 而不是/bin/bash, bash用得是source, sh用得是点
# RUN . ./venv/bin/activate
 
# 对pip进行升级
RUN python3 -m pip install --upgrade pip
 
# 安装运行python所需要的包
RUN pip3 install -r requirements.txt
 
# 启动nginx和uwsgi，这里一定要加上-g，主要目的就是设置pid=1。因为docker 容器默认会把容器内部第一个进程，也就是pid=1的程序作为docker容器是否正在运行的依据，如果pid=1的程序挂了，那容器就挂了。
ENTRYPOINT nginx -g "daemon on;" && uwsgi --ini uwsgi.ini