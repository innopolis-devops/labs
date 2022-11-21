# Devops lab Java application

Grigorii Kostarev

### Overview

This is java application for displaying current Moscow time.

### Build and run

1. Clone repository
2. `cd lab/app_java`
3. Download maven (for example `brew install maven`)
4. Run `mvn spring-boot::run`
5. Check `127.0.0.1:8080`

### Docker

Docker file was added to project. Now you can run application in container.

Follow steps to run:
1. Run `docker run -d -p 8080:8080 noneword/app_java`
2. Check `127.0.0.1:8080`

Follow steps to stop:
1. Run `docker stop <name_of_container>`

Another way to run application:
1. Run `cd ..`
2. Run `docker-compose up`
3. Check `127.0.0.1:4568`

Follow steps to stop:
1. Run `docker-compose down`

### Tests

Follow step:
1. Run `mvn test`

### Visits
After starting application:
1. All visits with time are on file visits.json
2. Using `/visits` endpoint, check all visits time

### Contact

Email: g.kostarev@innopolis.university  
Tg: @noneword