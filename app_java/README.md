# Moscow time demonstration

## Overview

This web-application is created to let the user be aware of the current time in Moscow. Every time you update the page, it shows you the actual time in the capital of Russia.

## Build and Run

Firstly, you have to clone current project via command:  
`$ git clone https://github.com/Maxkoz777/devops.git`  
Secondly, you have to change working directory by command:  
`$ cd app_java`  
After that you should install [Maven](https://maven.apache.org/install.html)  
Then you have to execute command in the project root in terminal:  
`$ mvn spring-boot:run`  
Finally, the application will be up and running [here](http://127.0.0.1:8080)

### Docker approach

* download [docker](https://www.docker.com)
* run commands from the section above if you haven't cloned this repository yet:  
  `$ git clone https://github.com/Maxkoz777/devops.git`  
  `$ cd app_java`
* run command:
  `$ docker-compose up`
* application will be up and running [here](http://127.0.0.1:8080)
* to stop current application run:
  `$ docker-compose down`

## Tests

Application is covered with unit tests which are executed after each project update in VCS
For this application only a single test is necessary to check the correctness of the program

## CI pipeline

Project is using CI workflow covering different aspects of application such as 
building, testing, vulnerabilities check and automatic image deployment to docker hub

## Contact

You can contact me via telegram: **@maxkoz666**