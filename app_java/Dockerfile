FROM maven:3.8.2-jdk-11-slim AS build
COPY src /app_java/src
COPY pom.xml /app_java/pom.xml

RUN addgroup --system app
RUN adduser --system --group app
RUN chown app:app app_java
USER app

RUN mvn -f /app_java/pom.xml clean package

FROM openjdk:11-jre-slim
COPY --from=build /app_java/target/app_java-0.0.1-SNAPSHOT.jar /app_java/local/lib/app_java.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app_java/local/lib/app_java.jar"]