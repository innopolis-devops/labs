# Best practices

1. Avoid unnecessary privileges. Most containers run by the root user, while most of the 
time it is not needed. Good practise to avoid it, and create a special user for those purposes.
   * Make executables owned by root and not writable. This will block the executing user 
   from modifying existing binaries or scripts, which could enable different attacks.

2. Reduce attack surface.
   * Use trusted and maintained images to reduce number of vulnerabilities and problems.
   * Expose only those ports that application needs.

3. Prevent confidential data leaks.
   * Use `.dockerignore` file to exclude not relevant files from build context.

4. Keep layer sanity. The order in the Dockerfile instructions is very important.
RUN, COPY, ADD, and other instructions will create a new container layer, grouping multiple commands
together will reduce the number of layers.

5. Don’t install unnecessary packages to reduce complexity, dependencies, file sizes, and build times.

6. Sort multi-line arguments alphanumerically for the ease to maintain and update.

7. Place Docker layers in such order to maximize build cache.

8. Use linting to detect bad practices in the Dockerfile.

9. Use labels to maintain and organise images.
