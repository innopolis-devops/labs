# About best practices

## Web application in Python

### Framework

When choosing a framework for a web application I had to choose between [Flask](https://flask.palletsprojects.com/en/2.2.x/) and [Django](https://www.djangoproject.com), and in the end I chose the first one because it is lightweight and more suitable for small applications.

So here are the **advantages** of the Flask framework:

- it is easier to use for simple cases;

- it has smaller size of the code base;

- it has higher flexibility.

And **disadvantages**:

- it is more potential for security risks;

- it requires more complicated maintenance for larger implementations.

### Best practices

Here are some best practices that have come in handy for me when developing a web application in Python and that can also be applied to other stacks:

- Use a virtual environment and `requirements.txt` that allows you to automatically pull up the dependencies you use when you deploy.

- Use `.gitignore` to avoid bringing extra files into the repository (such as a local virtual environment).

- Use [Docker](https://www.docker.com) to have and provide the ability to quickly run the service on any computer.

- Use `.dockerignore` to avoid bringing extra files into the container (such as markdown files and virtual environment).

- Use [uWSGI](https://uwsgi-docs.readthedocs.io/en/latest/) to run Flask application and [nginx](https://www.nginx.com) as a reverse proxy to it.

- Use [Jinja](https://jinja.palletsprojects.com/en/3.1.x/) or similar templating tools to create flexible templates for web pages.

## Linters

- As a linter for Python, I chose `pycodestyle`, which is essentially PEP8. The reason I chose it is because the PEP8 specifications were created directly by the Python community, so I trust it more.

- As a linter for markdown, I chose `markdownlint`, which has a handy extension for my development environment and is very popular.

## Unit Tests

I used the well-known [pytest](http://pytest.org) framework to write unit tests. Basically, I wrote only one test for the time parser, but still, here are the best practices I followed:

- Parameterize the input data and similar behavior.

- Use [pytest conventions](https://docs.pytest.org/en/7.1.x/explanation/goodpractices.html#conventions-for-python-test-discovery) in the naming of test files and functions.

- Use a separate `tests` directory with `__init__.py` file to easily run tests outside of it.

- Import only the modules, objects and functions you need for testing.
