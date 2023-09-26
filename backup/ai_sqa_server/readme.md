### 构建镜像

```shell
# 编写Dockerfile, 执行run.py
python run.py 1
# 等待构建成功后执行
python run.py 2
```

### 使用镜像

```bash
docker load < auto_image_sqa_ai.tar
docker images
docker image tag 26ae1ca44e84 10.175.94.63:9006/ai_sqa_serve
docker images
docker rmi registry.cn-shenzhen.aliyuncs.com/auto_image/sqa_ai
```

### 启动容器

```bash
# 编写docker-compose.yml
docker-compose up -d
docker ps -a
docker logs --tail=20 2ed0b810f29f
```

