# registry.cn-shenzhen.aliyuncs.com auto_image test latest
# 使用Ubuntu作为基础镜像FROM ubuntu:latest# 安装wget工具RUN apt-get update && apt-get install -y wget# 使用wget下载文件，并保存到容器内的指定路径RUN wget -O /myfile.zip https://hf-mirror.com/bartowski/codegeex4-all-9b-GGUF/resolve/main/codegeex4-all-9b-Q8_0.gguf# 指定容器启动后执行的命令，这里只是一个示例，可以根据需要修改CMD ["bash"]