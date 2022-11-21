# Devops lab Java application

Grigorii Kostarev

### Overview

This is python application for displaying current Moscow time.

### Build and run

1. Clone repository
2. Run `cd lab/app_java`
3. Run `python -m venv venv`
4. Run `pip install -r requirenments.txt`
5. Run `gunicorn --bind 127.0.0.1:8080 'app:app'`
6. Check `127.0.0.1:8080`

### Docker

Docker file was added to project. Now you can run application in container.

Follow steps to run:
1. Run `docker run -d -p 8080:8080 noneword/app_python`
2. Check `127.0.0.1:8080`

Follow steps to stop:
1. Run `docker stop <name_of_container>`

Another way to run application:
1. Run `cd ..`
2. Run `docker-compose up`
3. Check `127.0.0.1:4567`

Follow steps to stop:
1. Run `docker-compose down`

### Tests

Follow step:
1. Run `pytest app_python`

### Visits
After starting application:
1. All visits with time are on file visits.json
2. Using `/visits` endpoint, check all visits time

### Contact

Email: g.kostarev@innopolis.university  
Tg: @noneword