# Best practices for writing Dockerfile

1. Use multi-stage builds when it is needed because it drastically reduces the final size of the image and perfectly uses caching of layers and stages.

2. It is important that you minimized the number of layers in your images to ensure they were performant. Minimize the number of layers by grouping RUN, COPY and ADD instructions.

3. To exclude files not relevant to the build (without restructuring your source repository) use a .dockerignore file.

4. To reduce complexity, dependencies, file sizes, and build times, avoid installing extra or unnecessary packages just because they might be “nice to have.” For example, you don’t need to include a text editor in a database image.

5. Whenever possible, ease later changes by sorting multi-line arguments alphanumerically. This helps to avoid duplication of packages and make the list much easier to update. 

6. Whenever possible, use current official images as the basis for your images.

7. You can add labels to your image to help organize images by project, record licensing information, to aid in automation, or for other reasons.

8. Use rootless containers.

9. Use trusted base images.

10. Use base images that are frequently updated, and rebuild yours on top of them.

11. Use linting to detect bad practices in the Dockerfile. The most popular linter is hadolint.

## References

    - https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
    - https://sysdig.com/blog/dockerfile-best-practices/