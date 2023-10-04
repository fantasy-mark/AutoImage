import os
import sys
 
# sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
import json
from flask import request, Flask, jsonify
from dotenv import load_dotenv
 
# 创建一个Flask应用
app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False
 
@app.route('/')
def show_hello():
    myname = os.getenv('myname')
    return myname
 
if __name__ == '__main__':
    # 从.env文件中加载环境变量
    load_dotenv()
    # 本地运行的话，可以直接访问localhost:8086
    app.run(port=8086)