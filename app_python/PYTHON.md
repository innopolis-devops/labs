# Python practices

## Best practices for Python application

1. Use `.gitignore` file to exclude not relevant files from the git.
2. Use virtual environment for each project to not mess all packages and their versions in the system.
3. Use linters to fix little mistakes, stylistic inconsistencies, and dangerous logic:

- [pylint](https://pylint.org)
- [pyflakes](https://github.com/PyCQA/pyflakes)
- [pycodestyle](https://github.com/PyCQA/pycodestyle)

4. Use static analysis tools to easily detect vulnerabilities or some problems:

- [pylint](https://pylint.org)
- [pyflakes](https://github.com/PyCQA/pyflakes)
- [prospector](https://prospector.landscape.io/en/master/)

5. Use formatting tools:

- [black](https://github.com/psf/black)
- [flake8](https://github.com/PyCQA/flake8)
- [isort](https://github.com/PyCQA/isort)

## Practices in my application

1. Use `.gitignore`
2. Use `pipenv` to create virtual environment
3. Use [Trunk.io](https://trunk.io/) to lint and formatting code

## Why FastAPI ?

### Pros:

1. Fast API validates the developer’s data type even in deeply nested JSON requests.
2. Fast API is built on standards like JSON Schema (a tool used for validating the structure of JSON data), OAuth 2.0 (it’s the industry-standard protocol for authorization), and OpenAPI (which is a publicly available application programming interface)
3. FastAPI makes it easy to build a GraphQL API with a Python library called graphene-python.

### Cons:

1. Because FastAPI is relatively new, the community is small compared to other frameworks, and regardless of its detailed documentation, there is very little external educational materials.

## Best practices for Unit tests:

1. Unit tests are checking the functionality of one particular part of the program(e.g. function), so refactoring the code helps for unit testing.
2. Make your unit test as small as possible, in a way that the minimum possible piece of code is involved. This way, when an error appears, you will be able to quickly assess where it originated.
3. Parametrize your tests. Don't use the same test copy-pasted many times with different inputs. With Pytest you can reduce it to only one test.
4. Try to use Test Driven Development in the project.
