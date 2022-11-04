# Docker best practices

* Avoid running docker container as root user. Make sure the user specified in the USER instruction exists inside the container.
    > I created an `appuser` user inside the container and running the application as it.

* Make use of multistage building features to have reproducible builds inside containers.
    > I created a Python virtual environment inside the build container with all required dependencies and just copied it to the final container.

* Locally scan images during development. Docker has a pre-installed ```docker scan``` plugin to scan all dependencies.
* Use a `.dockerignore` file to prevent leaking secrets and keep the container clean.

* Expose only the ports that your application needs.

* Since RUN, COPY, ADD, and other instructions will create a new container layer, grouping multiple commands together will reduce the number of layers.

* Place the commands that are less likely to change, and easier to cache, first.

* Use linters to make sure your Dockerfile follows best practices.
    > I used [hadolint](https://github.com/hadolint/hadolint).
