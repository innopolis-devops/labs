# Docker best practices

All of the principles below are taken from [guide](https://sysdig.com/blog/dockerfile-best-practices/)

### 1. Avoid unnecessary privileges

**1.1. Rootless containers**

I have created a non-root user `python` with the `python` group. I am running entrypoint as this new non-root user.

**1.2. Don’t bind to a specific UID**

The container is running as a non-root user, but user UID is not a requirement (you can start the container with any UID you like).

**1.3. Make executables owned by root and not writable**

In my container, all files owned by root (including executable files). The `python` user has read-only permissions.

### 2. Reduce attack surface

**2.1. Multistage builds**

To ensure stability in docker builds on different architectures, I use a multi-stage build. In the first step I use a full `python:3.9` image. I create a virtual environment, install all needed dependencies (I build them using `gcc` if needed). On the second stage I copy all built dependencies into `python:3.9-slim` - python image with minimal tools (without `gcc`)

**2.2. Distroless, from scratch**

I use the minimal required base container - `python:3.9-slim` (not just `python:3.9`). The **-slim** image is a paired down version of the full image. This image has only the minimum packages to run python.

**2.3. Use trusted base images**

I use the official image `python:3.9-slim`.

**2.5. Exposed ports**

I expose only the ports that your application needs. Also I use EXPOSE to flag and document only the required ports in the Dockerfile, and then stick to those ports when publishing or exposing in execution.

### 3 Prevent confidential data leaks

**3.1 Credentials and confidentiality**

I do not put any secret or credentials in the Dockerfile instructions (environment variables, args, or hard coded into any command). Also, my image do not contain confidential information or configuration values.

**3.2 ADD, COPY**

I use COPY (not ADD) to copy data to the container

**3.3 Build context and dockerignore**

I am using `.dockerignore` file to restrict building content. More other, in this file I ignore all files except some.

### 4 Others

**4.1 Layer sanity**

Since RUN, COPY, ADD, and other instructions will create a new container layer, I group multiple commands together to reduce the number of layers.

**4.3 Linting**

I use [Haskell Dockerfile Linter (hadolint)](https://github.com/hadolint/hadolint) to detect bad practices in my Dockerfile.
