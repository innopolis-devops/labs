FROM python:3.8-slim-buster

WORKDIR /app

COPY app_python .

RUN pip install --no-cache-dir -r requirements.txt && \
    addgroup admins && \
    adduser admin admins

USER admin

EXPOSE 5000

ENTRYPOINT ["/app/entrypoint.sh"]
