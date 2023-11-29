#!/bin/bash

# 使用正则表达式提取首行注释符后单词作为镜像名
first_line=$(head -n 1 Dockerfile)
pattern="# ([^ ]+)"
if [[ $first_line =~ $pattern ]]; then
	image_name=${BASH_REMATCH[1]}
else
	image_name="undefine_image_name"
fi

docker-compose build
docker image ls