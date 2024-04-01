# 使用官方的Python 3.9镜像作为基础镜像
FROM python:3.9
 
# 设置工作目录
WORKDIR /app
 
# 复制当前目录下的文件到工作目录
COPY . /app
 
# 运行bash命令行界面
CMD ["bash"]