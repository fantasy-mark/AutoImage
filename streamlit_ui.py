import subprocess

import streamlit as st

# pip install streamlit
# streamlit run .\self\streamlit_train.py

st.write('### 构建image')
col1, col2, col3 = st.columns(3)
repo_name = col1.text_input(label='##### Repo', value='registry.cn-shenzhen.aliyuncs.com', )
user_name = col2.text_input(label='##### User', value='auto_image')
image_name = col3.text_input(label='##### Image')

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


def build_image():
    command = f'git add . && ' \
              f'git commit -m "Build image {image_name} at https://github.com/fantasy-mark/AutoImage/actions" && ' \
              f'git push -u origin main'
    exec_cmd(command)


if image_name:
    st.button('Build', on_click=build_image())
else:
    st.button('Build', disabled=True)

st.divider()


def download_image():
    command = f'docker pull {repo_name}/{user_name}/{image_name}'
    exec_cmd(command)


st.write('### 下载image')
if image_name:
    st.button('Download', on_click=download_image())
else:
    st.button('Download', disabled=True)




