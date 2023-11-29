#!/bin/bash

# 使用正则表达式提取首行注释符后单词作为镜像名
first_line=$(head -n 1 Dockerfile)
pattern="# ([^ ]+)"
if [[ $first_line =~ $pattern ]]; then
	image_name=${BASH_REMATCH[1]}
else
	image_name="undefine_image_name"
fi

docker build -f Dockerfile -t $image_name:${version} .

# 使用Dockerfile构建镜像,推送镜像到镜像仓库 - 对应 https://cr.console.aliyun.com/cn-shenzhen/instance/repositories
version="latest"
docker tag $image_name:${version} registry.cn-shenzhen.aliyuncs.com/auto_image/$image_name:${version} 
docker login --username=${{ secrets.DOCKER_USERNAME }} --password=${{ secrets.DOCKER_PASSWORD }} registry.cn-shenzhen.aliyuncs.com
docker push registry.cn-shenzhen.aliyuncs.com/auto_image/$image_name:${version}
if [ $? -eq 0 ]; then
	echo "docker push Success"
else 
	echo "docker push Failed"
fi