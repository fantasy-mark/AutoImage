# jupyter_notebook
FROM python:3.9.0

RUN pip install jupyterlab

WORKDIR /jupyter

EXPOSE 11001

CMD ["bash", "-c", "jupyter lab --notebook-dir=/jupyter --ip 0.0.0.0 --port 11001 --no-browser --allow-root"]