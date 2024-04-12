FROM ubuntu:20.04  

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \  
    apt-get install -y \  
        cron \  
        python3.9 \  
        python3-pip \  
        subversion \  
        git
RUN pip3 install click chardet tqdm Flask peewee flask-cors pandas

WORKDIR /work  
  
CMD ["sh", "run_scc.sh"]