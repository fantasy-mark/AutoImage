FROM python:3.8    WORKDIR /app    EXPOSE 8000    ENV NAME World    CMD ["python", "app.py"]