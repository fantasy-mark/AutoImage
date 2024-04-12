FROM ubuntu:20.04  
  
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