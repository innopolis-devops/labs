# About Docker best practices

Here are some best practices I have followed for containerization in Docker:

- **Minimize the number of layers.** Since the operations `RUN`, `COPY`, `ADD` create new layers, it is recommended to group the operations in them as much as possible.

- **Use `COPY` instead of `ADD`,** because although they are similar, `ADD` supports additional features that may not be immediately obvious.

- **Use the .dockerignore file** to exclude files not relevant to the build.

- **Split complex `RUN` statements to multiple lines** separated with backslashes to improve readability of your Dockerfile.

- **Always use `WORKDIR` with an absolute path** to the working directory inside the container, and never use manual moving through the hierarchy via `cd` command instead.

As a linter for the Dockerfile, I used the well-known tool [hadolint](https://github.com/hadolint/hadolint), written in Haskell.
