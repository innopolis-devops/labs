# Python time app

## Overview

When a server starts, one can open a given address in a browser to see current time in Moscow (MSK). The page will automatically refresh each 5 seconds.

![demo](README/demo.png)

## Best practices

- Automatically generated the project via [manage-fastapi](https://github.com/ycd/manage-fastapi)
  - Project structure was explained on [SO](https://stackoverflow.com/a/64987404)

- Used [poetry](https://python-poetry.org/) for Python dependency management
  - Created a `.venv` via `poetry` later

- Used linters and formatters (available in VSCodium)

- I adapted An HTML [template](https://www.freecodecamp.org/news/html-starter-template-a-basic-html5-boilerplate-for-index-html/). There is an explanation of why specific tags vere included.

- I applied PEP8 [recommendation](https://peps.python.org/pep-0008/#package-and-module-names) to name the code directory `time_app`

## Chosen framework

[FastAPI](https://fastapi.tiangolo.com/)

### Pros

- Fast
- Fast to code
- Fewer bugs (uses types extensively)
- Intuitive
- Easy
- Short (minimal code duplication)
- Robust
- Standards-based (OpenAPI)

### Cons

- `async`-s sometimes get in the way
 larger implementations

## Linters, checkers, formatters

### Python

- [mypy](https://github.com/python/mypy) - a static type checker
- [pylint](https://github.com/PyCQA/pylint) - a static code analyzer

### Markdown

- [markdownlint](https://github.com/DavidAnson/markdownlint)

### HTML & Jinja2

- [djlint](https://www.djlint.com/) - a [jinja2](https://jinja.palletsprojects.com/en/3.1.x/templates/) and `HTML` linter

## Misc

### Dockerfile

- Here's why one should use `exec` form for `ENTRYPOINT` and `CMD` in a `Dockerfile` - [docs](https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example), [SO](https://stackoverflow.com/a/72444233)
  - to be able to store child processes spawned by a shell
  - to provide the default command in `ENTRYPOINT` with overridable `CMD`
- If a command expects a string as a parameter, it should look like `["sh", "-c" "command" ]`
