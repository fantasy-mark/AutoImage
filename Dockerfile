FROM swr.cn-north-4.myhuaweicloud.com/infiniflow/ragflow-base:v1.0
USER  root

WORKDIR /app 
WORKDIR /work  
  
ENTRYPOINT ["run_scc.sh"]