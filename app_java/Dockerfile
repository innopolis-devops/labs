#
# Build stage
#
FROM maven:3.8.6 AS build

COPY src /home/app/src

COPY pom.xml /home/app

RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:16

COPY --from=build /home/app/target/docker-lab.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]
