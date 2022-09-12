FROM openjdk:17

WORKDIR /app_java

COPY . .

EXPOSE 8080
RUN chmod +x mvnw
ENTRYPOINT ["./mvnw", "spring-boot:run"]