# Describing of the use of Docker

## Best practices applied

* The use of multistage build
* The use of command COPY over ADD
* Base images are trusted. [Official Maven image](https://hub.docker.com/_/maven) and [official OpenJDK image](https://hub.docker.com/_/openjdk).
* Base image for openjdk is slim
* Rootless container (added custom user and changed owner of app files)
* Only one port is exposed for app
* Credentials and confidentiality are not stored in the resulting image
* Use of `.dockerignore` file to remove unnecessary files from resulting image


## Linter for Dockerfile

In this project I used [hadolint linter](https://github.com/hadolint/hadolint).

### How to run linter?
* Navigate to `./app_java`
```shell
cd ./app_java
```
* Run linter
```shell
hadolint Dockerfile
```

*Example of run*:
![docker-linter.png](./images/docs/docker-linter.png)