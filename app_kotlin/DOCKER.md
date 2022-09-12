# Best practices

- Added `.dockerignore` to increase performance
- Base maven images specified with version, to ensure correct work
- Added `Makefile` to reuse some of the commands
- used multi-stage builds to reduce image size.
Size reduced from 620 MB in first version to 227.81 in second.

# Linter

## Installation

```bash
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint
```

## Usage

```bash
hadolint <target file name>
```
