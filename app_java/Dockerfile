FROM openjdk:17-jdk-slim-buster

ARG JAR_FILE=target/*.jar

WORKDIR /app_java

COPY ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app_java/app.jar"]