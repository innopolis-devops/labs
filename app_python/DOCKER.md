# Best practices

- Added `.dockerignore` to increase performance
- Base python image specified with version, to ensure correct work
- Added environment variable to decrease duplications
- Installing requirements on build to make server start faster

# Linter

## Installation

```bash
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint
```