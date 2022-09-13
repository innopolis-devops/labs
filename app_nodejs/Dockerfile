# syntax=docker/dockerfile:1

FROM node:12.18.1
ENV NODE_ENV=production
LABEL maintainer="a.drenyasova@innopolis.university"

RUN useradd -ms /bin/bash app

WORKDIR /home/app

COPY . .
RUN npm install --save my-dependency

USER app

CMD [ "node", "app.js" ]