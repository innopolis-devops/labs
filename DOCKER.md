# Docker best practices for both apps

## `.dockerignore`

`.dockerignore` tells docker which files to exclude from the build context. When one calls `docker build` the build context (the files available to docker) is considered to be the current working directory. Subsequently, these files are transferred to the daemon which takes time. To reduce the copying, declare which files to exclude from build context inside `.dockerignore`.

## Keep number of layers small

Each instruction in Dockerfile creates a new read-only file system layer(\*) that consists of delta between new and old FS state. Thus to increase the build times, it's best to keep the number of layers small.

(\*) Only `RUN`, `COPY`, and `ADD` commands generate layers, other commands generate intermediate images.

## Use linters

One can use linters to check for conformance of these rules and to perform additional checks, like making sure the bash scripts are correct. One such linter is hadolint.