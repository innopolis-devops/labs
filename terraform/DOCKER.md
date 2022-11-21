# Docker

## Practices Applied

* Don't execute program as root
** `RUN adduser -D app && chown -R app .` --- create user `app` and grant permissions
for directory

* Don't bind some commands on user ID (e.g. `app` in previous line)
** `ENV APP_TMP_DATA=/tmp` --- set the directory for temp data of program, which
allows to write in it.

## Dockerfile Linter

The linter [Hadolint](https://github.com/hadolint/hadolint) was used.

Installation: [Download](https://github.com/hadolint/hadolint/releases/tag/v2.10.0)
binary file in release. Additionaly, you can add file to
[PATH](https://opensource.com/article/17/6/set-path-linux).

Usage: `hadolint Dockerfile`
