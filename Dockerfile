# 基于Python官方镜像
FROM python:3.11
 
# 安装Flask和Gunicorn
RUN pip install Flask==1.1.2 Gunicorn==20.0.4
 
# 设置环境变量
ENV FLASK_APP=/app/app.py
ENV FLASK_RUN_HOST=0.0.0.0
 
# 复制当前目录下的app.py到镜像中的/app目录
COPY app.py /app
 
# 对外暴露端口
EXPOSE 5000
 
# 运行Gunicorn服务器
CMD ["gunicorn", "-b", "$FLASK_RUN_HOST:5000", "$FLASK_APP"]