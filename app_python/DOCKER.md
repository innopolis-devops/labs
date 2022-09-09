# Docker-related info

## Best practices

* Avoid unnecessary privileges
  * Rootless container
  * Non-writeable scripts/executables (and owned by root)
* Reduce attack surface
  * Use slim image to not include unnecessary tools (and to allow less tools or other stuff for potential intruders to use). Also dropped image size from ~0.9 GB to 140 MB
  * Using official (thus trusted) Python docker image
  * Using latest stable python version as base image (tag `3.10` instaed of `latest` just in case some breaking changes appear later)
  * All dependencies are up-to-date (as of 7.9.2022), which means no known (and already solved by developers) vulnerabilities are present.
  * `EXPOSE` command is used as documentation for others to indicate that this image requires only one open port to function. In `docker-compose.yml` only this port is opened.
* Other
  * Not using wildcard copy `COPY . ./` to avoid unnecesary inlcusion of secrets or just redundant data.
  * Using `CMD` as default arguments for `ENTRYPOINT` for running the server. This also allows to change bind address without having to rebuild the image.
  * Chaining commands instead of creating new layers
  * Used linter `hadolint` and fixed a problem:
    * Added `--no-cache-dir` to requirements installation since we don't need the cache after the image is built
  * Used `docker scan` that uses `Snyk` to scan image for vulnerabilities. It showed lots of them, therefore I decided to switch to even more lighter base image `python:3.10-alpine`. Now it shows zero vulnerabilities and resulting image size is 61.3 MB.
  * Added `HEALTHCHECK` to detect not only termination of webserver process but also other problems

## Linter

[`hadolint`](https://github.com/hadolint/hadolint) was used. It suggested to add `--no-cache-dir` to pip line, nothing more was found.
