# Road to production ready application

## Best pracices applied

Best practices were retrieved from
<https://data-flair.training/blogs/python-best-practices/> and
<https://docs.python-guide.org/writing/style/>

1. Version Control System - Git
2. Readable documentation - README, code comments
3. Following code style guidelines - PEP8
4. Use the PyPI instead of doing it yourself
5. Following The Zen of Python
6. Readable code
7. Using virtual environment
8. Using linters - flake8

## Why FastAPI?

The FastAPI framework was chosen because of its simplicity,
high development speed,
extensive and detailed documentation,
and also because of my experience of working with it.

It is production ready framework:

1. 100% test coverage
2. Used by Microsoft, Uber, Netflix, etc.
3. Constantly improving framework
4. Constantly growing community

Pros of FastAPI:

1. Everything stated above in the section
2. Speed of work in comparison to other Python frameworks
3. Async support
4. Auto documentation
5. Open Source

Cons of FastAPI:

1. Relatively new framework,
so a smaller community and less learning material compared to Django and Flask

## Linters and formatters

For Python code were used:

1. Linter [Flake8](https://pypi.org/project/flake8/):

   ``$ flake8 <file_name>``

2. Formatter [autopep8](https://pypi.org/project/autopep8/):

   ``$ autopep8 --in-place --aggressive --aggressive <filename>``

For Markdown were used:

1. [markdownlint](https://github.com/igorshubovych/markdownlint-cli)
and respective [VSCode plugin](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint):

   ``markdownlint <filename>``

## Unit tests

The code is tested with 2 scenarios:

1. Correct response with correct time to correct request
2. 404 Error to invalid request

## Unit tests best practices

1. Tests Should Be Fast
2. Tests Should Be Readable
3. Tests Should Be Deterministic
(I have used pytest.mark.freeze_time to freeze the time)
4. Parametrize the same behavior (I have used pytest.mark.parametrize)
