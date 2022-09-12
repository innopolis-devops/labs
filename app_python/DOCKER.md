## docker best practices

some best practices from [sysdig](https://sysdig.com/blog/dockerfile-best-practices/) that i apllied

1. rootless container
2. don’t bind to a specific UID
3. use trusted base images
4. expose used ports only
5. no credentials hardcoded
6. linting (i used [hadolint](https://github.com/hadolint/hadolint))