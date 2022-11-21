# syntax=docker/dockerfile:1
FROM python:3.8-alpine
WORKDIR /application
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache
COPY app.yaml main.py requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
RUN mkdir persistent && touch persistent/visits
RUN adduser -D app && chown -R app .
USER app
ENV APP_TMP_DATA=/tmp
CMD ["flask", "run"]

HEALTHCHECK --interval=1m --timeout=5s \
  CMD wget --spider http://127.0.0.1:5000/ || exit 1
