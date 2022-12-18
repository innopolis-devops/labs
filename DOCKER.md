# Best practices for using Docker

## The list of used practices

### Avoid unnecessary privileges

1. **Use root-less containers**. Firstly, it will
help to reduce security risks. Secondly, your
container startup environment may by default block
the launch of such containers running as root.
1. **Do not use a specific UID**. If you run a
container (for docker, this is the "-u" option) with a
UID defined on the host system, this can break the
service inside the container when it tries to read
something from the container's file system.

### Reduce the attack surface

This practice is dedicated to minimizing the size of
your Dockerfile. Therefore, to minimization of the
vulnerabilities' amount.

1. **Use .dockerignore file** to exclude not relevant
files from build context.
1. **Use images** which are trusted and regularly
maintained in order to reduce the number of
vulnerabilities and problems.
1. **Update images frequently** for the newly
detected security vulnerabilities.
1. **Expose only those ports that application needs.**
1. **Group RUN, COPY and ADD instructions.** It helps
to minimize the number of layers. Other instructions
do not increase the size of build.
1. **Use** ENV PYTHONDONTWRITEBYTECODE=1. Keeps Python from
generating .pyc files in the container

### Other categories of important practices

1. **Include metadata labels** when building your image. This action will help\
in image management.
1. **Linting for Dockerfile**. It is needed to detect
bad practices in the Dockerfile. I have used *Haskell
Dockerfile Linter (Hadolint)* for this project.
Running Hadolint can detect common configuration
issues and prevent your builds from slower and less secure versions.
1. **Use COPY if you really don't need the ADD function.**
COPY is more predictable and less error-prone.
1. **Use only proven base images**. I have used the
official Python image that already has all the tools
and packages that we need to run a Python
application. And that already has been tested.
1. **The gpg key generation**: I have added an extra layer of security by using
the gpg key generation.
