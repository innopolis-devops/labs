## Best practices

- use VCS (github)
- use codestyle checkers (sonarlint)
- following application layering rule

## Framework

I used `Spring Boot` framework. It is  a tool for developing web application and microservices with Spring Framework faster and easier.

The pros of framework:

- Spring Boot can help developer to quickly build any applications without having to worry about their safe and correct configuration.
- Spring Boot is multi-threaded. This is useful when performing long or repetitive operations. When the main thread is consumed, others are used concurrently.
- Reduces the time spent on development and increases the overall efficiency of the development team.
- Helps to autoconfigure all components for a production-grade Spring app.
- Facilitates the creation and testing of Java-based applications by providing a default setup for unit and integration tests.
- Helps to avoid all the manual work of writing boilerplate code, annotations, and complex XML configurations.
- Comes with embedded HTTP servers like Jetty and Tomcat to test web applications.
- The integration of Spring Boot with the Spring ecosystem which includes Spring Data, Spring Security, Spring ORM, and Spring JDBC is easy.
- Provides many plugins that developers can use to work with embedded and in-memory databases smoothly and readily.
- Allows for easily connecting with database and queue services like Oracle, PostgreSQL, MySQL, MongoDB, Redis, Solr, ElasticSearch, Rabbit MQ, ActiveMQ, and many more.

The cons of framework:

- Lack of control. The opinionated style installs many additional dependencies (that often go unused) which increases the deployment file size.

## Linters

I used `SonarLint`. I chose this linter because I like that it shows not only the place with mistake,
but also shows rules with good and bad example of code style. Also, I like the way it classifies all code mistakes to
Bugs, Code Smells & Security Vulnerabilities.

I used `markdownlint` for Markdown style checking.
