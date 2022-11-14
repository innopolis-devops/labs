# Best practices for writing Dockerfiles

1. The image defined by your Dockerfile should generate containers that are can be stopped and destroyed, then rebuilt and replaced with an absolute minimum set up and configuration.
2. Use .dockerignore to exclude files not relevant to the build
3. Use multi-staged builds wnen applicable to drastically reduce the size of your final image, without struggling to reduce the number of intermediate layers and files.
4. Don't install unneccessary packages
5. Decouple application to multiple containers to make it easier to scale horizontally and reuse containers.
6. Minimize number of layers grouping `RUN`, `COPY` and `ADD` instructions
7. Sort multiline arguments. For example:

    ```Dockerfile
    RUN apt-get update && apt-get install -y \
    bzr \
    cvs \
    git \
    mercurial \
    subversion \
    && rm -rf /var/lib/apt/lists/*
    ```

8. Avoid runing container with root priviledges
9. Use linters for Dockefile. I used [hadolint](https://github.com/hadolint/hadolint)

For writing Dockerfile for our simple web application I used all listed best practices except `3` and `5`.

## References

- <https://docs.docker.com/develop/develop-images/dockerfile_best-practices/>
