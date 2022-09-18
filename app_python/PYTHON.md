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
It supports async (this app is asynchronous), and offers the auto-generated swagger documentation out-of-the-box (you can check it at `/docs`).
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


## Tests

I used pytest library to write the unit tests for my project

There is only one line of code that requires testing, that is the logic within the **current_time** endpoint. Using a mock client,
I have requested the resource, and compared the actual and expected responses. Since I would not be able to predict the exact time of execution, I freezed the time using **freezegun** library

Also, I followed these best practices

1. No "overtesting" — I did not test the libraries' logic, only the one I wrote myself
2. Maintaining clear tests directories structure
3. Adding tests dependencies only to the dev dependencies
4. Adding a testing stage to the Github Actions workflow
5. Adding a testing command to the Makefile configuration
6. Configuring pytest to show the coverage
7. Making sure the coverage is 100%
