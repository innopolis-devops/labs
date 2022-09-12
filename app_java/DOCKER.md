# Docker best practices

* added .dockerignore file to exclude optional files from image
* linter [hadolint](https://github.com/hadolint/hadolint) was used to check Dockerfile
* base image is free from any potential vulnerabilities
* **docker-compose.yml** added for simple app start