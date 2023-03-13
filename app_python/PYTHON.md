# Best Practices

- Use constants, intead of in-place code
- Write README, to briefly describe project and all related stuff
- Use venv (virtual environment)
- Write requirements.txt file with information about installed libs
- Use linters

# Framework Flask

I chose Flash because it has a small entry threshold

## Pros

- Easy to start
- Flask is light and flexible
- Small core and easily extensible

## Cons

- Less powerful than other frameworks (e.g. Django)
- Not async-friendly
- Lack of database

# Linters

## mypy

Mypy is a static type checker for Python
https://github.com/python/mypy

## flake8

Tool For Style Guide Enforcement
https://github.com/PyCQA/flake8

# Unit tests

I use `pytest` to test the app

I wrote a test that checks whether the main page was displayed correctly

## Best Practices

- Simple
- Isolated
- No API calls
- One scenario per test
