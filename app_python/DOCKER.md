# Best practices

- Added `.dockerignore` to increase performance
- Base python image specified with version, to ensure correct work
- Added environment variable to decrease duplications
- Installing requirements on build to make server start faster
- Added `Makefile` to reuse some of the commands

# Problems

- CMD is used with plain text, not with `["...", "..."]`, as documentation suggests. This is done to include
environment variable in the command, thus removing duplication

# Linter

## Installation

```bash
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint
```
