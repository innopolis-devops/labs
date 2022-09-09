## Best practices

- I use the minimal required base container `python:3.8-slim`. According to <https://hub.docker.com/_/python> slim image does not contain the common packages contained in the default tag and only contains the minimal packages needed to run python.
- I use trusted base image `python:3.8-slim`
- I use practice of exposed ports.
- I use  Credentials and confidentiality principle. I do not put any secret or credentials in the Dockerfile
- I use `COPY` command instead of `ADD`
- I use layer sanity principle
- I use linter for Dockerfile

About Multistage builds: it  havs no sense in this project, because in python all source files are required to work correctly.

## Linter

I have used online linter `https://www.fromlatest.io/#/`
