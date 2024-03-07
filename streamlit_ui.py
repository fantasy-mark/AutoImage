import subprocess

import streamlit as st
from utils import json

# pip install streamlit
# streamlit run .\self\streamlit_train.py

configs = json.read()

st.write('### 构建image')
col1, col2, col3, col4 = st.columns(4)
repo_name = col1.text_input(label='##### Repo', value=configs['repo'])
user_name = col2.text_input(label='##### User', value=configs['user'])
image_name = col3.text_input(label='##### Image', value=configs['image'])
version = col4.text_input(label='##### Version', value=configs['version'])

uploaded_file = st.file_uploader("##### 拖拽Dockerfile到这里")  # 指定可上传的文件类型

if uploaded_file is not None:
    file_contents = uploaded_file.read().decode('utf-8')  # 假设文件是文本文件
    st.code(file_contents, language='docker')


def exec_cmd(command):
    print(command)

    pipe = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    for line in iter(pipe.stdout.readline, b''):
        print(line.decode('utf-8').strip())
    pipe.wait()


def exec_task():
    global configs
    configs = {
        "repo": repo_name,
        "user": user_name,
        "image": image_name,
        "version": version
    }
    json.update(configs)

    command = f'git add . && ' \
              f'git commit -m "Build image {image_name} at https://github.com/fantasy-mark/AutoImage/actions" && ' \
              f'git push -u origin main'
    exec_cmd(command)


if image_name:
    st.button('Build', on_click=exec_task())
else:
    st.button('Build', disabled=True)

st.divider()


def download_image():
    command = f'python docker_pull.py {repo_name}/{user_name}/{image_name}'
    exec_cmd(command)


st.write('### 下载image')
if image_name:
    st.button('Download', on_click=download_image())
else:
    st.button('Download', disabled=True)




