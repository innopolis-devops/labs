FROM cirrusci/flutter:3.3.0 AS build

RUN apt update && apt install -y nginx

RUN flutter config --enable-web

RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web