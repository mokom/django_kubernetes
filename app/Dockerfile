FROM python:3.8.10

COPY . /app

WORKDIR /app

RUN /opt/venv/bin/pip install pip --upgrade && \
    /opt/venv/bin/pip install -r requirements.txt && \
    chmod +x entrypoint.sh 

CMD ["/app/entrypoint.sh"]
