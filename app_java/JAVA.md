# Technology stack explained

## Best Practises

* added **.gitignore** to store only necessary files in git
* **docker** wasn't used as it will be added as a part of 2nd lab task
* used **JUnit5** framework for tests
* followed best practises for package structure

## Java framework

For this particular project I have chosen **Spring** framework with its project **SpringBoot**

### Pros

* Spring Framework can be employed on all architectural layers used in the development of web applications
* Uses the very lightweight POJO model when writing classes
* Allows you to freely link modules and easily test them
* Supports declarative programming
* Eliminates the need to independently create factory and singleton classes
* Supports various configuration methods
* Provides middleware-level service

### Cons

* Lack of control. Spring Boot creates a lot of unused dependencies, resulting in a large deployment file
* The complex and time-consuming process of converting a legacy or an existing Spring project to a Spring Boot application
* Not suitable for large-scale projects. Although it’s great for working with microservices, many developers claim that Spring Boot is not suitable for building monolithic applications

## Linting

### Java code

For this project I used **Sonarlint** linter which can be added as a plugin to all popular java IDEs

### Markdown

As **Markdown linter** I used pycharm plugin **Markdown**

## Testing

For this application I used [Mockito](https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html) 
and [JUnit](https://junit.org/junit5/docs/current/user-guide/) which are both Java testing frameworks

### Best Practices

* **test** directory added with proper package structure for tests
* only necessary imports are present inside tests
* no _"overtesting"_ as only single `moscowTime()` method from TimeService was tested for proper work
* **ApplicationContext** wasn't used in tests as we are testing only a service layer without any interactions
with another layers
* if any other layer will be injected to TimeService, with it can be mocked
with **Mockito** framework in order not to raise whole **ApplicationContext** from Spring