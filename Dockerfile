# 使用官方的Python 3.9镜像作为基础镜像
FROM python:3.10

# 设置工作目录
WORKDIR /app

RUN pip install Flask

 
WORKDIR /work  
  
CMD ["sh", "run_scc.sh"]