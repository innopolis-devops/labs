# 1. Best practices used for docker
- Use Multi-stage Builds
- Order Dockerfile Commands Appropriately
- Use Small Docker Base Images
- Include .dockerignore 
- Use Unprivileged Containers (non-root users)
- Prefer COPY Over ADD
- Cache Python Packages to the Docker Host
- Prefer Array Over String Syntax (e.g. CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"])
- Don't Store Secrets in Images

# 2. Docker Linting

- For linting, I used dockerfile linter