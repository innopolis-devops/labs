# Docker

## Best practices
1. Rootless container. I created a non-root user to run the app.
2. Use alpine base image. I used `python:3.8-alpine` base image instead of `python:3.8`. As a result, the size of the resulting images dramatically decreased.
3. Use `EXPOSE` directive. I added `EXPOSE` command to explicitly specify the port that application listens to.
4. Place app sources in separate folder. I put source code in `app` folder, which is then copied to the image. This way, no unnecessary files (such as README or backups) are present in the resulting image.
5. Combine several `RUN` directives in one. I combined adjacent `RUN` commands, which results in less container layers.
6. Place files that are less likely to change first. In my Dockerfile, I first copy `requirements.txt` and then the rest of the code. Since the dependencies do not change often, docker will use cached requirements most of the time when building image.

## Dockerfile Linter
I used [hadolint](https://github.com/hadolint/hadolint). The Dockerfile is formatted according to the linter.