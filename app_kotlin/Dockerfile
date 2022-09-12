# syntax=docker/dockerfile:1

FROM maven:3.8.6-openjdk-18

WORKDIR /app

COPY . .

EXPOSE 8080

RUN chmod +x ./mvnw

RUN mvn install

CMD ./mvnw spring-boot:run
