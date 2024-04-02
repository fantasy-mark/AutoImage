# 基于Python官方镜像
FROM python:3.11
 
# 安装Flask和Gunicorn
RUN pip install Flask Gunicorn
 
# 设置环境变量
 
# 复制当前目录下的app.py到镜像中的/app目录
COPY app.py gunicorn_config.py /app
 
# 对外暴露端口
EXPOSE 5000

WORKDIR /work
 
CMD ["sh", "run.sh"]