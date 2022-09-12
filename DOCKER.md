# Best-practices for Dockerfile that I used

+ Caching layers is the most common best practice in docker. First, copy only files that related to installing dependencies, then copy files to build your application
+ Use several base images (docker multi-stage builds) for rust application to decrease image size. First image downloads dependencies to build binary, second image only has to run binary.
+ use lightweight images to decrease image size. I decided to use `python-slim`
+ add `.dockerignore` and add some files you don't want to copy in dockerfile. for example `__pycache__` folder
+ add `docker-compose`. It will compose several images together and configure container settings.
+ join consecutive RUN with `&`
+ use lightweight container images, I used `distroless` for rust, `alpine` for python.
+ use nonroot user for safety
+ use linter for dockerfile: **hadolint**
