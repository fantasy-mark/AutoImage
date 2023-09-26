import subprocess

DOCKER_REPO = r"registry.cn-shenzhen.aliyuncs.com"

print()
print(f"1. 通过Dockerfile构建镜像")
print(f"2. 从仓库下载镜像")
option = input("输入需要执行的任务(回车确认):")
print()

with open('Dockerfile', 'r') as fp:
    image_name = fp.readline().strip().split()[-1]

if "1" == option:
    command = f'git add . && ' \
              f'git commit -m "Build image {image_name} at https://github.com/fantasy-mark/AutoImage/actions" && ' \
              f'git push -u origin main'
elif "2" == option:
    command = f'python docker_pull.py {DOCKER_REPO}/auto_image/{image_name}'
else:
    command = 'echo "Invalid command."'

# 执行外部命令
pipe = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

# 获取实时输出
for line in iter(pipe.stdout.readline, b''):
    print(line.decode('utf-8').strip())

# 等待命令执行完成
pipe.wait()
