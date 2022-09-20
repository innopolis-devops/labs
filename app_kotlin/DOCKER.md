# Best practices

- Add `# syntax parser directive`  which always points to the latest release
  of the version 1 syntax.
- Don’t bind to a specific UID.
- Dockerfile should make the final image, so we can just run it
  without additional configuration.
- Use trusted base images.
- Use the minimal required base image.
- Use a specific image version.
- Expose ports that we really want to use.
- Use `COPY` over `ADD`. `COPY` is more predictable and less error-prone.
- Optimize caching image layers. So, place the commands that are less likely
  to change, and easier to cache, first.
- Run as a non-root user.
- Use the `.dockerignore` file to exclude unnecessary files.
- Try not to use `.` to avoid accidentally copying unwanted files.
  E.g. use `docker build -t app_kotlin_image app_kotlin` instead of
  `docker build -t app_kotlin_image .`
- Use linters for Dockerfile. I used [hadolint](https://github.com/hadolint/hadolint)
   - cd into the folder with `Dockerfile`
   - run this command `docker run --rm -i hadolint/hadolint < Dockerfile`

Most of these practices I took from [here](https://sysdig.com/blog/dockerfile-best-practices/)

## Docker multi-stage builds

- To run the server application we need to build it into a .jar file.
  That's why I used the multi-stage builds to firstly build an application
  and only after that work with executable .jar
  file
- The `build` stage includes compilation, linters check, running tests
  and creating the .jar file.
- For this Dockerfile, I used this
  [reference](https://codefresh.io/docs/docs/learn-by-example/java/gradle/)
