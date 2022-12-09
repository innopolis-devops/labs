FROM node:16.18.1-alpine3.15
LABEL maintainer="d.gubajdullin@innopolis.university"

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3333
CMD [ "npm", "start" ]
