## Python best practices

* Use virtual environment for the development: allows you to install the correct versions of the libraries and avoid conflicts with the main python environment
* Use [poetry](https://python-poetry.org/) - the dependency manager: guarantee of reproducibility of the project on other computers, separate environment to production and development.
* Use [FastAPI](https://fastapi.tiangolo.com/) - modern, fast (high-performance) web framework
* Use ASGI web server ([Uvicorn](https://www.uvicorn.org/)) for productions. [Do not use](https://fastapi.tiangolo.com/deployment/docker/#replication-number-of-processes) Gunicorn in Docker containers as we want to handle replication at the cluster level instead of using a process manager (like Gunicorn with workers) in each container.
* Use [Jinja2](https://pypi.org/project/Jinja2/) templates to generate an HTML response
* Use [Docker](https://www.docker.com/) for quick and easy app deployment: guarantee of reproducibility of the project on other computers

* Use [Makefile](https://en.wikipedia.org/wiki/Make_(software)#Makefile) and `make` command for quick access to frequently used commands
* Use 3 auto formatters ([isort](https://pycqa.github.io/isort/), [black](https://pypi.org/project/black/), [autoflake](https://pypi.org/project/autoflake/)) to save time on bringing the code to the PEP 8 style
* Use 4 linters ([flake8](https://pypi.org/project/flake8/), [pylint](https://pypi.org/project/pylint/), [mypy](https://mypy.readthedocs.io/en/stable/), [black](https://pypi.org/project/black/)) to check that the code conforms to the PEP 8 style and to check the types

I chose FastAPI because:

* I already have experience with this framework
* It is simple, fast, modern, asynchronous



## Achieving the PEP 8 style

We use 3 linters at once to check whether the code matches the PEP 8 style. Each linter has its own weaknesses, which are compensated by using more than one linter together.

- **Flake8** is flagging lots of issues related to whitespace and blank lines
- **Pylint** is identifying violations with naming conventions and layout (docstrings, import order, etc)
- **Black** reveals even more formatting errors. Including in spaces and blank lines

In addition we use Python typing and a linter (**Mypy**) which checks that the types are correct.

To avoid wasting a lot of time formatting code manually, we use 3 auto-formatters that complement each other and correct most formatting errors.

* **isort** - sort imports alphabetically, and automatically separated into sections and by type
* **Black** - fix most of the errors related to whitespace and line breaks
* **Autoflake** - remove unused imports