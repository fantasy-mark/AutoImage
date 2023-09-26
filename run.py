import subprocess

DOCKER_REPO = r"registry.cn-shenzhen.aliyuncs.com"

print(f"1. 通过Dockerfile构建镜像到 {DOCKER_REPO} 仓库")
print(f"2. 从 {DOCKER_REPO} 仓库下载镜像到 image/ 目录")
option = input("输入需要执行的任务(回车确认):")

with open('Dockerfile', 'r') as fp:
    first_line = fp.readline().strip()
    image_name = first_line.split()[-1]

if "1" == option:
    command = f'git add . && ' \
              f'git commit -m "Build image {image_name} at https://github.com/fantasy-mark/AutoImage/actions" && ' \
              f'git push -u origin main'
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode == 0:
        print(f"Build Successful, You can pull image ({image_name}) from {DOCKER_REPO}")
    else:
        print("Command execution failed!")
elif "2" == option:
    command = f'python docker_pull.py registry.cn-shenzhen.aliyuncs.com/auto_image/{image_name}'
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode == 0:
        print(f"Pull {image_name} Successful")
    else:
        print("Command execution failed!")
