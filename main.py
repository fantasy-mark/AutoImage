import sys
 
import json
from flask import request, Flask, jsonify
 
# 创建一个Flask应用
app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False
 
@app.route('/')
def show_hello():
    return "hello"
 
if __name__ == '__main__':
    from werkzeug.contrib.fixers import ProxyFix
    app.wsgi_app = ProxyFix(app.wsgi_app)
    app.run(host='0.0.0.0', port=8000)
