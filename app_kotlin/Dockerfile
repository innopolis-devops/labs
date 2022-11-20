# syntax=docker/dockerfile:1
# Use gradle image
FROM gradle:7.5-jdk17-alpine AS build

# Copy source code into the container
COPY --chown=gradle:gradle . /home/gradle/src

# Change the working directory
WORKDIR /home/gradle/src

# Run build: includes linters, tests, generating .jar file
RUN gradle build --no-daemon


# Use jdk image
FROM openjdk:17-jdk-alpine

# Expose a port container uses
EXPOSE 8080

# Create a folder for .jar file
RUN mkdir /app

# Copy .jar file into 'app' folder
COPY --from=build /home/gradle/src/build/libs/*.jar /app/app_kotlin-0.0.1-SNAPSHOT.jar

# Add and use non root user
RUN adduser --system --no-create-home server
USER server

# Entrypoint for running .jar file which is actually our web application
ENTRYPOINT ["java","-jar","/app/app_kotlin-0.0.1-SNAPSHOT.jar"]
