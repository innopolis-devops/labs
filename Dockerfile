FROM python:3.9-alpine

WORKDIR /app

COPY app_python/app.py .
COPY app_python/requirements.txt .

RUN pip install -r requirements.txt

# ensure that timezone is set to UTC
RUN apk add tzdata
ENV TZ=UTC
ENV VISITS_FILE=/app/visits.txt

ENV FLASK_APP=app.py

EXPOSE 5000

HEALTHCHECK --interval=10s --timeout=10s --retries=2 CMD curl -sS 127.0.0.1:5000 || exit 1

CMD ["flask", "run", "--host=0.0.0.0"]
