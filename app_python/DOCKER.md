## Dockerfile best practices

# Avoid giving unnecessary privileges

In order to not run my container as a UID 0, I created a dedicated user for this app and gave ownership of a folder to this user, so my app would not have any unnecessary permissions.

# Use trusted base images

For this build, I used official Python Docker image. This image has over 1 billion pulls, and also official, so it is trustworthy.

# Specify exposed ports carefully

My app is listening on port 5000, so I only exposed 5000 port in Dockerfile and in `docker run -p 5000:5000` command.

# Linting

For my Dockerfile linting I used `hadolint`. Initially, it only showed the warning of using `pip` with cache directory. I fixed it by adding `--no-cache-dir` parameter.