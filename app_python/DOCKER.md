# Used Docker's best practices for app_python

## Privilege minimization

```dockerfile
RUN useradd $APP_USER; chown $APP_USER $APP_DIR
USER $APP_USER
```

Installing python virtual environment, dependencies and server running
goes under non-root user.

## Keeping images minimal

This is done by using **slim** version of official python's image.

Also, I am using official docker approved image of python. 

## Layer sanity

Grouping several run commands together.

```dockerfile
RUN useradd $APP_USER; chown $APP_USER $APP_DIR
```

_Instead of_

```dockerfile
RUN useradd $APP_USER
RUN chown $APP_USER $APP_DIR
```

## Linting

Used tool - **[Hadolint](https://github.com/hadolint/hadolint)**

No issues were found.

## Using `.dockerignore` file

This increases leakage safety and helps to copy only required for production files.