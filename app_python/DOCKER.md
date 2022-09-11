## Best practices

- Represent `Dockerfile` instructions by read-only layers: FROM COPY RUN CMD
- Create ephemeral containers. Container can be stopped and destroyed, then rebuilt and replaced with an absolute minimum set up and configuration.
- Understand build context. Regardless of where the Dockerfile actually lives, all recursive contents of files and directories in the current directory are sent to the Docker daemon as the build context.
- Use multi-stage builds. 
- Sort multi-line arguments. Whenever possible, ease later changes by sorting multi-line arguments alphanumerically. This helps to avoid duplication of packages and make the list much easier to update. This also makes PRs a lot easier to read and review. 