﻿FROM ubuntu:22.04
RUN apt-get update && apt-get install cron -y && apt-get install python3 -y && apt-get install python3-pip -y && apt-get install git -y
WORKDIR /work

CMD ["sh", "run_scc_git.sh"]