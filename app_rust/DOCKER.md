# Docker-related info

## Best practices

* Avoid unnecessary privileges
  * Rootless container
  * Non-writeable scripts/executables (and owned by root)
* Reduce attack surface
  * Utilize multi-stage build
  * Use distroless image to not include unnecessary tools (and to allow less tools or other stuff for potential intruders to use). Also significantly dropped image size.
  * Using trusted (Google) docker image
  * All dependencies are up-to-date (as of 10.9.2022, via `cargo update`), which means no known (and already solved by developers) vulnerabilities should be present.
  * `EXPOSE` command is used as documentation for others to indicate that this image requires only one open port to function. In `docker-compose.yml` only this port is opened.
* Other
  * Not using wildcard copy `COPY . ./` to avoid unnecesary inclusion of secrets or just redundant data.
  * Placing config file in the last layers to utilize caching.
  * Chaining commands instead of creating new layers
  * Used linter `hadolint` and didn't find any problems.
  * Used `docker scan` that uses `Snyk` to scan image for vulnerabilities. I already used distroless, so it reported 0 vulnerabilities.
  * Added `HEALTHCHECK` to detect not only termination of webserver process but also other problems

## Linter

[`hadolint`](https://github.com/hadolint/hadolint) was used. It did not find any problems.
