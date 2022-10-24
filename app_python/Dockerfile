FROM python:3.9-alpine
LABEL maintainer="Timur Nugaev t.nugaev@innopolis.university"

ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8081

WORKDIR /app_python

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["flask", "run", "--port=8081"]

EXPOSE 8081