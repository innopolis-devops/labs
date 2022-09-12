# Best practices for Docker
1. Use multistage builds since it uses layers and stages caching
2. When building images, always tag them with useful tags which codify version information. Do not rely on the automatically-created latest tag
3. Don’t install unnecessary packages to reduce complexity, dependencies, file sizes, and build times
4. Minimize the number of layers by grouping `RUN`, `COPY` and `ADD` instructions
5. Do not create virtual environments in the container, use the base image's python environment
6. Use linting, for example [hadolint](https://github.com/hadolint/hadolint)
