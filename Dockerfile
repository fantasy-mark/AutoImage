FROM ubuntu:22.04  
  
RUN apt-get update && \  
    apt-get install -y \  
        cron \  
        python3 \  
        python3-pip \  
        subversion \  
        git
RUN pip3 install click chardet tqdm Flask peewee Flask_Cors pandas

WORKDIR /work  
  
CMD ["sh", "run_scc.sh"]