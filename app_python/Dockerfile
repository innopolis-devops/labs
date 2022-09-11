# syntax=docker/dockerfile:1

FROM python:3.9.14-alpine3.16

ENV PORT 8000

WORKDIR /app

COPY . .

EXPOSE $PORT

RUN pip3 install --no-cache-dir -r requirements.txt

CMD uvicorn main:app --host 0.0.0.0 --port ${PORT}
