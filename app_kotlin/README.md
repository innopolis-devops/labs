# Moscow time

## Overview

This program returns time in Moscow in a standard ISO format, written in Kotlin with Spring Boot.

## Build

### Prerequisites

- Java 17+
- Maven

### Local installation and usage

`./app_kotlin/mvnw spring-boot:run`

You can see the app on `http://localhost:8080/moscow/time`

### Build via Docker

1. Pull the image

```bash
docker pull ziucay/kotlinapp:0.2
```

2. Run app

```bash
docker run -d -p 8080:8080 --rm --name kotlinapp ziucay/kotlinapp:0.2
```

## Software quality

You can run `mvn verify` to run `ktlint` linter.

Run vale <path to document> from repository root, to check Markdown docs.

## Contact

For questions and suggestions, write in [Telegram](https://web.telegram.org/): [@ziucay](https://t.me/Ziucay)