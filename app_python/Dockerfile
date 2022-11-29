FROM python:3.8-slim-buster

WORKDIR /app

COPY app_python .

RUN pip install --no-cache-dir -r requirements.txt && \
    addgroup -S admins && \
    adduser -S admin -G admins

USER admin

EXPOSE 5000

ENTRYPOINT ["/app/entrypoint.sh"]
