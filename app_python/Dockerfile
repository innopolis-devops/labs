FROM python:3.9-alpine
MAINTAINER Timur Nugaev t.nugaev@innopolis.university

WORKDIR /app_python

# выполнение нескольких команд в одной RUN директиве (чтобы экономить ресурсы на создании новых слоев)
#RUN apt-get update && \
#    apt-get install -y python3-pip

COPY . .

RUN pip3 install -r requirements.txt

# делаем ентрипоинт ENTRYPOINT["/usr/bin/python3", "./hello.py"] чтобы не меняли
# делаем CMD для всех последующих аргументов которые другие разрабы могут менять
ENTRYPOINT ["python", "./app.py"]

# EXPOSE 80/tcp или другой порт нужно чтобы просто показать это тому кто это будет запускать что писать в run -p
EXPOSE 8081