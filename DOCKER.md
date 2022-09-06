# Docker best practices

- Use podman instead of docker:
  - It does not require root to run it
  - Does not require daemon for running
- Use rootless containers
- Cache dependencies in different docker step
- Use multi-stage builds to reduce the size of the image
- Use minimal busybox image as base image for rust
- Use `.dockerignore` to exclude files form containers
- Minimize the number of layers (e.g. group together apt install && pip install)
- Remove caches from package managers
- Use COPY instead of ADD if not using the network
