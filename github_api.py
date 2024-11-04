#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/11/2 10:10
# @Author  : Mark
# @File    : github_api
# @Depart  : 
# @Desc    :
import requests

# 替换为你的 token 和仓库信息
token = 'your_github_token'
owner = 'your_username'
repo = 'your_repo'
headers = {
    'Authorization': f'token {token}',
    'Accept': 'application/vnd.github.v3+json'
}

# 创建 commit
commit_message = f'Build image {image_name} at https://github.com/fantasy-mark/AutoImage/actions'
data = {
    "message": commit_message,
    "tree": "tree_sha",  # 你需要获取最新的 tree SHA
    "parents": ["parent_commit_sha"]  # 你需要获取最新的 parent commit SHA
}
response = requests.post(f'https://api.github.com/repos/{owner}/{repo}/git/commits', json=data, headers=headers)
if response.status_code == 201:
    commit_sha = response.json()['sha']
    print(f'Commit created with SHA: {commit_sha}')
else:
    print('Failed to create commit:', response.text)

# 更新分支引用
ref_data = {
    "sha": commit_sha,
    "force": True
}
response = requests.patch(f'https://api.github.com/repos/{owner}/{repo}/git/refs/heads/main', json=ref_data, headers=headers)
if response.status_code == 200:
    print('Branch updated successfully.')
else:
    print('Failed to update branch:', response.text)