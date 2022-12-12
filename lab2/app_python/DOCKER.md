# Best practices
1. Use slim version of images as possible
2. Rootless containers
3. Properly handle PID 1, signal handling, and zombie processes 4. Make executables owned by root and not writable
5. Multistage builds
6. Distroless images and trusted base images
7. Update your images frequently
8. Exposed ports
9. Credentials and confidentiality
10. ADD, COPY
11. Build context and dockerignore 12. Layer sanity
13. Using pipes
14. Image scanning
15. Linting: https://hadolint.github.io/hadolint/#:~:text=A%20smarter%20Dockerfile%20linter%20that,Bash%20code%20inside%20RUN%20instructions.
16. Include health / liveness checks 17. Sign images and verify signatures