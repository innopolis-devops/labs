# Moscow time checker

## 💾 Information

Sometimes you want to know time in Moscow, but you cant.\
Now you can easily run this app, go to <http://localhost:8080> and see Moscow time!

## 📝 How to run

### Main dependencies

- Java - 15 or higher
- Maven - 3.6.3 or higher

### Building and testing

Go to ``app_java`` directory\
For building the project, write this command in terminal into the ``app_java`` directory.

``` java
mvn clean install
```
This command also run tests after building

### Run in one command

You can also run this app in 1 command, write this command
in terminal into the ``app_java`` directory.

``` java
mvn spring-boot:run
```

## 🐳 Docker

### Build image locally

    docker build -t inforest/app_java:app_java -f Dockerfile .

### Pull from Docker Hub

    docker pull inforest/app_java:app_java

### Run container with application

    docker run -p 8080:8080 --name app_java inforest/app_java:app_java

## 📪 Contacts

If you have any questions, please write me in Telegram: `@inforest`
