# Project environment

## Best practices

- use linters for consistent styling
- use 'constants' with a speaking name
- write requirements file with dependencies and their versions
- write README file with a description of the project and installation process
- use virtual environment for isolated development
- brief comments in code
- add .gitignore to avoid uploading unnecessary files that can be retrieved from 

## Tech stack

### Web framework

As a WEB framework, I have chosen Flask.

#### Pros

- Very lightweight
- Easy routing
- Can use HTML templates, intuitively understandable

#### Cons

- May perform worse if the app grows too much
- Requires additional server side (WSGI server, for example)

### Server

For server side, I used Gunicorn

### Linters

I used:

- `pymarkdown` for MarkDown linting
- `isort` for linting imports in .py files
- `black` for linting .py files after isort

Isort and Black are useful as they are not only linters, but also formatters.
