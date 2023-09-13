### 设置

[github secret](https://github.com/fantasy-mark/AutoImage/settings/secrets/actions) 设置 `DOCKER_USERNAME` \ `DOCKER_PASSWORD` secrets 

### 使用

* 备份旧的Dockfile

* 创建 Dockerfile 首行格式为 `# image_name`
* push
* CI 自动构建结束后，pull 镜像

```shell
docker pull registry.cn-shenzhen.aliyuncs.com/$image_name/app
```

