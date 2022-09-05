## Best practices

There are several best practices I applied

1. Managing the environment with the `.env` file
2. Managing the dependencies with poetry
3. Locking the fixed versions of the dependencies (poetry.lock)
4. Dockerizing the application
5. Using FastAPI (more on that matter below)
6. Using different linters (i.e., flake8, isort, and mypy)
7. Using Makefile to simplify the interaction with the app
8. Using configs to manage the desired timezone

## Framework

### Overview

I chose FastAPI because it is probably the most well-known framework out there.
It supports async (this app is asynchronous), and offers the auto-generated swagger documentation out-of-the-box (you can check it at `/docs`)
Also, I have most experience in this particular framework, so it was an easy choice

### Pros

There are a lot of pros, so I will just name the top 10 (in my opinion)

1. It is FAST
2. Asynchronous   
3. Built-in swagger docs
4. Extremely easy to setup
5. Amazing documentation
6. Huge community
7. Easy to test
8. Easy to develop
9. Dependency injection support
10. Data validation

### Cons

1. It does not really have any built-in security system 


## Linters

I used three different types of linters, those are flake8, isort, and mypy


### flake8
A general-purpose linter that checks whether your code follows PEP8

https://github.com/PyCQA/flake8

### isort
An amazing tool that sorts all the imports for you. I hate doing it myself :)

https://github.com/PyCQA/isort

### mypy
A linter that statically checks the typings you defined

https://github.com/python/mypy
