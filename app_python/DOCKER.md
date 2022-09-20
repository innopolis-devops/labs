# Best practices

- Add `# syntax parser directive`  which always points to the latest release
  of the version 1 syntax.
- Use the `--no-cache-dir` option in the `RUN` command to tell `pip` to not
  save the downloaded packages locally, as
  that is only if `pip` was going to be run again to install the same packages,
  but that's not the case when working
  with containers.
- Use the `--upgrade option` in the `RUN` command to tell `pip` to upgrade
  the packages if they are already installed.
  Because the previous step copying the file could be detected
  by the Docker cache, this step will also use the Docker
  cache when available.
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
  E.g. use `docker build -t app_python_image app_python` instead of
  `docker build -t app_python_image .`

- Use linters for Dockerfile. I used [hadolint](https://github.com/hadolint/hadolint)
   - cd into the folder with `Dockerfile`
   - run this command `docker run --rm -i hadolint/hadolint < Dockerfile`

Most of these practices I took from [here](https://sysdig.com/blog/dockerfile-best-practices/)
