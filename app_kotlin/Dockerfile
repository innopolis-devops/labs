# syntax=docker/dockerfile:1

FROM maven:3.8.6-openjdk-18 as maven

COPY ./pom.xml ./pom.xml

RUN mvn dependency:go-offline -B

COPY ./src ./src

RUN mvn package

FROM maven:3.8.6-eclipse-temurin-18-alpine

WORKDIR /app

COPY --from=maven /target/appkotlin.jar ./

EXPOSE 8080

CMD ["java", "-jar", "./appkotlin.jar"]
