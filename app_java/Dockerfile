FROM maven:3.8.6-eclipse-temurin-17 AS maven

WORKDIR /usr/tmp/app
COPY . /usr/tmp/app

RUN mvn package

FROM openjdk:17-jdk-slim

WORKDIR /usr/src/app

RUN adduser app_user && chown -R app_user /usr/src/app
USER app_user:app_user

COPY --from=maven --chown=app_user:app_user /usr/tmp/app/target/timeapp-0.0.1-SNAPSHOT.jar /usr/src/app/

HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD curl -sS 127.0.0.1/healthcheck || exit 1

EXPOSE 8080
ENTRYPOINT ["java","-jar","timeapp-0.0.1-SNAPSHOT.jar"]