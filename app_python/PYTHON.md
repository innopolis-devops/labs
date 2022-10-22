# Python

## Framework

The production ready framework `Flask` was used.
This framework has relatively useful instruments for backend development.

## Python Linter

The linter `flake8` was used.

Installation: `python3 -m pip install flake8`

Usage: `flake8 main.py`

## Markdown Linter

The linter `markdownlint` was used. You have to have `nodejs` and `npm` packages.

Installation: `npm install markdownlint-cli --save-dev`

Usage: `npx markdownlint README.md`

## Unit Tests

The program `pytest` was used.

Installation `python3 -m pip install pytest`

Usage `pytest *.py`

Tests:

* `datetime_format`: check if the output of function, which gets current datetime,
has datetime format.

## Best Practices

* Set automated tests
* Get maximum test coverage
* Give tests good names

## Metrics

For metrics [Prometheus Flask exporter](https://github.com/rycus86/prometheus_flask_exporter)
was used. Append `/metrics` to address to get status.

## Healthcheck

For healthcheck [Healthcheck](https://pypi.org/project/py-healthcheck/) was used.
Append `/healthcheck` to address to get status.
