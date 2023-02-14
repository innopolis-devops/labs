FROM python:3.9-alpine

WORKDIR /app

COPY app_python/app.py .
COPY app_python/requirements.txt .

RUN pip install -r requirements.txt

# ensure that timezone is set to UTC
RUN apk add tzdata
ENV TZ=UTC

ENV FLASK_APP=app.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
