# Python best practices

## Framework

Some of the avaliable frameworks for a web python application, are Django, Flask/FastApi, & Masonite.

One of the primary goals of Django is to make it easy to develop complex database-driven websites. 

While Flask is a micro web framework written in Python. A micro web framework is a web development framework with an easy setup and can be used in developing minimalistic web applications.(which makes it good for our case/tasl)

## Writing Well-Structured Python Code

Especially while making projects, you must include a README file for describing your project, the `setup.py` file for properly setting up your project in a new environment(The `setup.py` file is needed if the project is a package, which is not our case, & could  be omitted), and the `requirements.txt` for describing the dependencies that are needed for the project, and `requirements-dev.txt` for the development dependencies like for linters, testing, etc.

## Linters

Linting is checking that the code complies to certain requirements, like code style, cyclomatic-complexity, logical congruency, etc.

`pylint` is what's used in this project, it is a static code analysis tool to identify errors in Python code and helps programmers enforce good coding style. This tool enables them debugging complex code with less manual work.

The coding style that `pylint` applies to the code is known as PEP8.

Other options were to use `black`, or `flake8`.

## Testing 

Use pytest to test the application.

Create a tests directory and a test_ file for each test, mimicking the directory structure of the application.

Follow the Given-When-Then style of writing tests.

Do not modify the application code in tests.
