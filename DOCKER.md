# Docker Best Practices

* Reduce the number of layers in Dockerfile
* Use .dockerignore file to make build faster and lighter by excluding from the context files that are not used in the build
* Run as non-root user
* Do consolidation for consecutive instructions
* Store share data in volumes (as config file for example)
* Set Log Rotation
* Use linters for Dockerfile

## Linters choice

* For docker: [hadolint](https://github.com/hadolint/hadolint)
    ```bash
    docker run --rm -i hadolint/hadolint < Dockerfile
    ```