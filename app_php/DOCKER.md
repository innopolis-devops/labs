# Docker best practices

All of the principles below are taken from [guide](https://sysdig.com/blog/dockerfile-best-practices/)

### 1. Avoid unnecessary privileges

**1.1. Rootless containers**

I have created a non-root user `nobody` with the `nobody` group. I am running entrypoint as this new non-root user.

**1.2. Don’t bind to a specific UID**

The container is running as a non-root user, but user UID is not a requirement (you can start the container with any UID you like).

**1.3. Make executables owned by root and not writable**

In my container, all executable files owned by root. The `nobody` user has read-only permissions.

### 2. Reduce attack surface

**2.1. Multistage builds**

PHP is an interpreted language, so all source files are required for the program to work correctly. Thus, there is no advantage of multistage builds.

**2.2. Distroless, from scratch**

I use the minimal required base container - `trafex/php-nginx:2.6.0`. This image has only the minimum packages to run PHP.

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
