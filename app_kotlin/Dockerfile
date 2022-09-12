# syntax=docker/dockerfile:1

FROM maven:3.8.6-openjdk-18

ENV PORT 8080

WORKDIR /app

COPY . .

EXPOSE $PORT

RUN mvnw spring-boot:install

CMD mvnw spring-boot:run
