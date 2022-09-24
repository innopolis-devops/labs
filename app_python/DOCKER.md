# Best practices

1. Avoid running as root: created "moscower"
2. Use trusted base images: used oficial python image
3. Expose application ports only: 80 in our case
4. No credentials shall leak into Dockerfile
5. Avoid ADD instruction, stick to COPY
6. Put unlikely to change commands first: new user, which most likely will not change, then requirements, which might be updated from time to time, then the code itself, which is the most frequently updated one
7. Use linters: hadolint