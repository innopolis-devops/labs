# Python time app

## Overview

When a server starts, one can open a given address in a browser to see current time in Moscow (MSK). The page will automatically refresh each 5 seconds.

![demo](README/demo.png)

## Best practices

- Project structure for a FastAPI app - [SO](https://stackoverflow.com/a/64987404)
  - Created automatically via [manage-fastapi](https://github.com/ycd/manage-fastapi)

- Created a `.venv` via `poetry`

- From `flask`'s [documentation](https://flask.palletsprojects.com/en/2.2.x/tutorial/layout/), I used:
  - project layout
  - `.gitignore` file

- I applied PEP8 [recommendation](https://peps.python.org/pep-0008/#package-and-module-names) to name the code directory `time_app`

- I followed this Digital Ocean's [tutorial](https://www.digitalocean.com/community/tutorials/how-to-make-a-web-application-using-flask-in-python-3#step-3-using-html-templates) to create a basic `flask` app.

- I adapted An HTML [template](https://www.freecodecamp.org/news/html-starter-template-a-basic-html5-boilerplate-for-index-html/). There is an explanation of why specific tags vere included.

## Chosen framework
  
[flask](https://github.com/pallets/flask) - a popular Python web framework.

In [comparison](https://www.stxnext.com/blog/flask-vs-django-comparison/) to [Django](https://github.com/django/django), another popular web framework, here is the characteristics of `flask`:

- **Pros**:
  - higher flexibility
  - higher compatibility with latest technologies
  - high scalability for simple web applications
  - technical experimentation
  - customization
  - slightly higher framework performance
  - easier to use for simple cases
  - smaller size of the code base

- **Cons**:
  - more potential for security risks
  - slower MVP development in most cases
  - more complex tech stack
  - higher maintenance costs for more complex systems
  - more complicated maintenance for larger implementations

## Linters

- The following checkers for Python:
  - [mypy](https://github.com/python/mypy) - a static type checker
  - [pylint](https://github.com/PyCQA/pylint) - a static code analyzer
- The following checker for Markdown
  - [markdownlint](https://github.com/DavidAnson/markdownlint)
