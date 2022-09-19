FROM cirrusci/flutter:3.3.0 AS build

RUN flutter config --enable-web
RUN mkdir /app/

EXPOSE 5000

COPY . /app/

WORKDIR /app/
RUN flutter build web