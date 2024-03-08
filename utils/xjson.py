import json


def read(filename='config.json'):
    with open(filename, 'r') as file:
        data = json.load(file)

    return data


def update(datas, filename='config.json'):
    try:
        with open(filename, 'w', encoding='utf-8') as file:
            json.dump(datas, file, ensure_ascii=False, indent=4)
    except Exception as e:
        print(f"写入 {filename} 文件时发生错误：{e}")

