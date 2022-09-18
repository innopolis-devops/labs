FROM python:3.9-alpine
LABEL maintainer="Timur Nugaev t.nugaev@innopolis.university"

WORKDIR /app_python

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["flask", "run", "--port=8081"]

EXPOSE 8081