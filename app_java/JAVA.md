# i. Overview
It is simple Java web application that shows the current currency exchange for rubles, tenge, and japanese yen in dollars.

# ii. Getting Started 
## Installation 
Before running application, install:
* Maven 3.8+

## Running
1. To run application, first go to the folder *app_java*
2. Then run following command:
    ```
    mvn clean 
    ```  
    ```
    mvn install 
    ```
    ```
    mvn spring-boot:run 
    ``` 

3. Application will open at http://localhost:8080/.

## Docker
1. Install [Docker](https://docs.docker.com/engine/install/)
2. Then run following commands:
    ```
    docker pull diazzzu/devops:app_java
    ```
    ```
    docker run -p 8080:8080 diazzzu/devops:app_java
    ```
3. Application will open at http://localhost:8080/. 


# About Java application 

1. Use [Spring Boot](https://spring.io/projects/spring-boot/)
2. Use [Currency API](https://currency.getgeoapi.com/)
3. Use [Apache HttpClient](https://mvnrepository.com/artifact/org.apache.httpcomponents/httpclient)


