# Python

## Python application best practices

* Use version control system (git)
* Add license information
* Use dependency management tool (poetry)
* Follow style guidelines (PEP8)
* Use libraries from PyPI
* Follow the Zen of Python
* Use virtual environment (via poetry)
* Use data classes
* Use appropriate .gitignore file
* Use type checker (mypy)
* Use pre-commit
  * black  - auto code formatter and linter
  * flake8 - linter and error checker
  * isort  - sort imports
  * mypy   - type checker
* Use production ready libraries
  * Aiohttp - is asynchronous library which provides web-server and web-client functionality.
    Used by large companies ([link](https://docs.aiohttp.org/en/stable/powered_by.html)).
    * Pros:
      * This is one of most permonant Python web frameworks for IO bound tasks
        (if you are looking for CPU-bound tasks, why you are using Python?),
        because uses fastest event-loop written in plain C.
      * Contains small set of required functionality which can be extended by plugins,
        so modularity principles applied and your app can use only necessary dependencies.
      * No dictating "right way" for developers, your application can be designed
        as you want, not as "framework wants".
    * Cons
      * Because library in lower level comparing to others,
        requires more experience from developer.

## Unit tests best practices

1. Tests are short and readable, so developers will not waste long time on them
2. Tests are parametrized, so testing same behaviour for different endpoints is
   not a problem
3. Tests are deterministic (no side effects, everything is controlled by test
   itself)
