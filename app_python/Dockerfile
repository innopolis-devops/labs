FROM python:3.10-slim

WORKDIR /app

RUN ["addgroup", "-S", "moscowergroup"]
RUN ["adduser", "-S", "moscower", "-G", "moscowergroup"]

USER moscower

COPY ./requirements.txt /app/requirements.txt
RUN ["pip", "install", "--no-cache-dir", "--upgrade", "-r", "/app/requirements.txt"]

COPY ./app /app
COPY ./templates /app/templates

EXPOSE 80

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
