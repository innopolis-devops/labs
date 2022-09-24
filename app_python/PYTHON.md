# General

1. Use `.gitignore` file to keep avoid unnecessary files from being version-controlled
2. Use linters and prettyfiers to avoid mistakes during development and help keep code consistent (usually comes with IDEs/easily installable)

# Framework
While advantages are best described by the [docs](https://fastapi.tiangolo.com/features/), the main reasons for choosing FastApi were

1. It is production-ready
2. Ease of use, low entry threshold (e.g. compared to Django)
3. Still has lots of features out of the box:
    1. Testing tools
    2. Templates

# Testing
1. Each unit test should test one individual piece of functionality - a function or a class
2. Make utility functions and classes to help you instantiate test environment in order to reduce code repetition

# Python
1. Keep a requirements.txt file with all project's dependencies
2. Use virtual environment to avoid affecting global packages and allow use of multiple versions of the same package by different projects
3. Do not forget to add to `.gitignore` python-related files and folders, e.g. `__pycache__`