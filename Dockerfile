# cofa_ai_serve
FROM python:3.9.0
WORKDIR /home
EXPOSE 5000

CMD ["sh", "/home/run.sh"]