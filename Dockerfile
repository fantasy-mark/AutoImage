FROM ubuntu:22.04  
  
RUN apt-get update && \  
    apt-get install -y \  
        cron \  
        python3 \  
        python3-pip \  
        subversion \  
        git  
  
WORKDIR /work  
  
CMD ["sh", "run_scc.sh"]