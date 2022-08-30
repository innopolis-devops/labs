# Notes about Python's best practices

## Virtual Environment

PyCharm offered to make a virtual environment for the project.
Folks say it's better because it won't bloat your main Python instance with extra libraries,
and save you from version mismatches.

## Frameworks

I chose FastAPI because:
- It is _fast_, simple, and easy to use.
- It's asynchronous.
- Its small size fits this task best.
- I have some experience with it.
- Type validation for bigger projects (it's a must, otherwise it's hell).

It cas a couple of problems that are negligible for the task:
- Can't build a beautiful UI.
- Bloated `main` file.

To run it, one has to use `uvicorn`.
However, it's only used for development and testing,
so it's better to use `gunicorn` because, unlike the previous one,
it's production-ready, and can do neat stuff to optimize the service.
(If only `gunicorn` worked on Windows).

There are also some libraries to work with dates and time. Built-in `zoneinfo` refused to work,
so I decided to go for more reliable `pytz` even though it costs one more line in `requirements.txt`.

## `requirements.txt` 

A must. Just a list with all libraries the project needs.

In the future, `Dockerfile` will automagically install those.

## Codestyle

Default PEP-8:
- `snake_case_for_all_variables_and_functions`.
- `PascalCaseForClasses`.
- Suffix `Error` when declaring custom exceptions.
- 2 blank lines between functions, and 1 between methods.
- Blank line at the end of file.
- Proper import order (built-ins, then side packages, then your code).
- *Type hints. Are. Important.*

Linters:
- Built-in PyCharm linter
- MyPy for validating type hints.

Recommended but not yet used: `black` ([link](https://github.com/psf/black)).

Another thing I wanted to do is try to follow _The Clean Architecture_ by Uncle Bob just because I can.

Questionable thing I did was introducing a custom exception.
The one `pytz` offered wasn't enough for me to notify the user about what they do wrong,
but it was possible to avoid making a new one.
