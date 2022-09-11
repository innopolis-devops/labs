FROM node:16
LABEL maintainer="Timur Nugaev t.nugaev@innopolis.university"

WORKDIR /app_javascript

# выполнение нескольких команд в одной RUN директиве (чтобы экономить ресурсы на создании новых слоев)
#RUN apt-get update && \
#    apt-get install -y python3-pip

COPY . .

RUN npm install

# делаем ентрипоинт ENTRYPOINT["/usr/bin/python3", "./hello.py"] чтобы не меняли
# делаем CMD для всех последующих аргументов которые другие разрабы могут менять
ENTRYPOINT ["npm", "start"]

# EXPOSE 80/tcp или другой порт нужно чтобы просто показать это тому кто это будет запускать что писать в run -p
EXPOSE 8082