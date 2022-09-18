# Python best practices

* Use virtual environment for the development: allows you to install the correct versions of the libraries and avoid conflicts with the main python environment
* Use [poetry](https://python-poetry.org/) - the dependency manager: guarantee of reproducibility of the project on other computers, separate environment to production and development.
* Use [FastAPI](https://fastapi.tiangolo.com/) - modern, fast (high-performance) web framework
* Use ASGI web server ([Uvicorn](https://www.uvicorn.org/)) for productions. [Do not use](https://fastapi.tiangolo.com/deployment/docker/#replication-number-of-processes) Gunicorn in Docker containers as we want to handle replication at the cluster level instead of using a process manager (like Gunicorn with workers) in each container.
* Use [Jinja2](https://pypi.org/project/Jinja2/) templates to generate an HTML response
* Use [Docker](https://www.docker.com/) for quick and easy app deployment: guarantee of reproducibility of the project on other computers
* Use [Makefile](https://en.wikipedia.org/wiki/Make_(software)#Makefile) and `make` command for quick access to frequently used commands
* Use 3 auto formatters ([isort](https://pycqa.github.io/isort/), [black](https://pypi.org/project/black/), [autoflake](https://pypi.org/project/autoflake/)) to save time on bringing the code to the PEP 8 style
* Use 4 linters ([flake8](https://pypi.org/project/flake8/), [pylint](https://pypi.org/project/pylint/), [mypy](https://mypy.readthedocs.io/en/stable/), [black](https://pypi.org/project/black/)) to check that the code conforms to the PEP 8 style and to check the types
* Use [markdownlinter](https://github.com/DavidAnson/markdownlint) to check Markdown files (exclude rule MD033 - I prefer a pretty README.md to proper one)

I chose FastAPI because:

* I already have experience with this framework
* It is simple, fast, modern, asynchronous

## Achieving the PEP 8 style

We use 3 linters at once to check whether the code matches the PEP 8 style. Each linter has its own weaknesses, which are compensated by using more than one linter together.

* **Flake8** is flagging lots of issues related to whitespace and blank lines
* **Pylint** is identifying violations with naming conventions and layout (docstrings, import order, etc)
* **Black** reveals even more formatting errors. Including in spaces and blank lines

In addition we use Python typing and a linter (**Mypy**) which checks that the types are correct.

To avoid wasting a lot of time formatting code manually, we use 3 auto-formatters that complement each other and correct most formatting errors.

* **isort** - sort imports alphabetically, and automatically separated into sections and by type
* **Black** - fix most of the errors related to whitespace and line breaks
* **Autoflake** - remove unused imports

## Unit tests

In order to test, I needed to do some refactoring: I needed to separate the logic from the presentation, and to divide the program into small modules that could be tested individually.
For testing I used the [pytest](https://pytest.org/) module, which is actively being developed and allows easy and simple testing of python applications. Since the application is very simple, to test the whole application well I needed to write 3 unit tests to test all the modules individually and 1 integrated test to test the whole program as a whole.

Best practices (from [brightsec.com](https://brightsec.com/blog/unit-testing-best-practices/)):

* Write Readable, Simple Tests - My tests are very simple and readable (due to the use of parametrization)
* Write Deterministic Tests - All my tests are deterministic and predictable. When testing time, I have taken into account that time zones in countries can change
* Test One Scenario Per Test - Each of my tests only tests one scenario per test. I use parametrization to test multiple scenarios.
* Unit Tests Should Be Automated - All tests are run with a single command. In addition, I plan to set up a CI
* Write Isolated Tests - Each unit test only tests one specific function/module
* Avoid Test Interdependence - All my tests are independent of each other. For this, I use the [pytest-mock](https://pypi.org/project/pytest-mock/) library, which allows you to mock functionality that should not be tested in a given test
* Avoid Active API Calls - To avoid using the API, I use the [starlette](https://www.starlette.io/), which allows you to test the API without having to call it
* Combine Unit and Integration Testing - That's exactly what I'm doing. I use 3 unit tests to test individual modules, then use one test to test the whole functionality
* Ensure Unit Tests are Repeatable and Scalable - All my tests are readable and scalable. All thanks to pytest's use of parametrization, which allows you to reuse one simple test to test different scenarios
* Test for Security Issues as Part of Your Unit Tests - Added to CI
