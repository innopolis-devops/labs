## Docker best practices

### Use trusted base images
In my docker file I used 'FROM python:3.8-slim-buster',
this is trusted image marked as docker official image

### ADD, COPY
In my Dockerfile I used COPY over ADD as COPY is more predictable and error prone.

### Linting
As a dockerfile linter I used [Haskell Dockerfile Linter (hadolint)](https://github.com/hadolint/hadolint)
I followed the steps described below:
1) `brew install hadolint`
2) `cd app_python`
3) `hadolint Dockerfile`