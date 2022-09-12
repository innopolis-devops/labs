# Best practices for writing Dockerfile

1. Use multi-stage builds since it uses caching of layers and stages. 

2. Do not create virtual environments in the container, use the base image's python environment. Because it is waste of resources.

3. Reduce attack surface
   * Use trusted and maintained images to reduce number of vulnerabilities and problems.
   * Use `.dockerignore` file to exclude not relevant files from build context.
   * Expose only those ports that application needs.
   * Update images frequently as new security vulnerabilities are discovered every day.

4. Minimize the number of layers by grouping `RUN`, `COPY` and `ADD` instructions. Other instructions do not increase the size of build.

5. Don’t install unnecessary packages to reduce complexity, dependencies, file sizes, and build times.

6. Sort multi-line arguments alphanumerically for the ease to maintain and update.

    Example:
    ``` Dockerfile
    RUN apt-get update && apt-get install -y \
      bzr \
      cvs \
      git \
      mercurial \
      subversion \
      && rm -rf /var/lib/apt/lists/*
    ```

7. Avoid unnecessary privileges
    * Make executables owned by root and not writable. This will block the executing user from modifying existing binaries or scripts, which could enable different attacks.
    * Avoid using root user to run the container. There are a few use cases when the container needs to be executed by root, so try to use `USER` instruction to change the default UID from 0 to a rootless user.

8. Include metadata labels when building your image. This action will help in image management: application version, link to website, how to contact the maintainer.

9. The Docker image should generate a container that can be stopped and destroyed, then rebuilt and replaced with an absolute minimum set up and configuration.

10. Use linting to detect bad practices in the Dockerfile. The most popular linter is [hadolint](https://github.com/hadolint/hadolint).

11. Scan the images to detect potential problems and security issues. It is recommended to scan images every week. 

    There are a lot of popular tools for scanning images: [snyk](http://snyk.io), [trivy](https://github.com/aquasecurity/trivy), [grype](https://github.com/anchore/grype) and etc.
