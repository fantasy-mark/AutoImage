FROM ubuntu:latestRUN apt-get update && apt-get install -y wgetADD https://hf-mirror.com/bartowski/codegeex4-all-9b-GGUF/resolve/main/codegeex4-all-9b-Q8_0.gguf /myfile.zipCMD ["bash"]