FROM python:3.8-slim-buster

WORKDIR /app

COPY app_python .

RUN adduser --disabled-password --gecos "" admin && chown -R admin /app && pip3 install -r requirements.txt

USER admin

EXPOSE 5000

ENTRYPOINT ["/app/entrypoint.sh"]
