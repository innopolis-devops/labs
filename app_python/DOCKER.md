# Dockerfile best practices
- ### Reducing attack surface
    I have used an image among the trusted base images - python:3.8-slim-buster
- ### Exposed ports
    While building and running only the port needed for application is used. SSH ports are not exposed.
- ### Preventing the leak of confidential data
    No sensitive or confidential data such as environment vars and args were used.
- ### ADD and COPY
    COPY command was prefered instead of an ADD becuse it is less prone to error
- ### Reducing number of layers
    Combining same commands together allowed to reduce the number of layers
- ### Order of layers
    First comes the commands which are less likely to change in the future
- ### Linting
    [ hadolint ] linter was used to find the bad practices in the Dockerfile. 

[hadolint]: <https://hadolint.github.io/hadolint/>