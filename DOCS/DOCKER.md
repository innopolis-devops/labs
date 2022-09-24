## Best practicies for Docker & Dockerfile

1. Create non-root user for application

    Inside the `Dockerfile` I create new user `adduser -D app_user`, pass ownership of all files to root `chown -R root ./`, give permissions to user `chmod -R 755 ./` and switch to that user `USER app_user`.

    By this way, processes within container won't be able to change data inside but only read and execute it.

    However, I personally recommend to not work on machine as root at all if it's avoidable.

2. Make executables owned by root and not writable

    As I said previously, I pass ownership to root and take away write permissions for data immutability and security.

3. Reduce base image (distroless)

    To avoid vulnerability because of the executables you don't even need, it's better to use the image with minimal required binaries.
    
    In my case, I use python:3.9 image as a base instead of (e.g.) ubuntu.

4. Keep unused ports closed 

    I expose only 1 necessary for HTML requests port - 5000, which it written in Dockerfile.

5. Don't put confidential information inside container

    I have no secrets for this project, however it is important to pass secret words with `--secret` parameter.

6. Prefer COPY over ADD

    Because ADD is more error prone than COPY, it is better to use the last one when possible.

7. Layer control

    Try to combine commands in order to reduce number of created layers. It's good to save disk space and for better performance.