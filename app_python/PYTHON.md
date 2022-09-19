# Python

## Best Practicies

### 1. Follow style guidlines

You can refer to [PEP8](https://peps.python.org/pep-0008/) for conventions.
Here are the main of them:

- Use proper naming conventions for variables, functions, methods, and more.
- Variables, functions, methods, packages, modules: this_is_a_variable
- Classes and exceptions: CapWords
- Protected methods and internal functions: _single_leading_underscore
- Private methods: __double_leading_underscore
- Constants: CAPS_WITH_UNDERSCORES
- Use 4 spaces for indentation.

### 2. Write Readable Code

- You should use line breaks and indent your code.
- Use naming conventions for identifiers -
  this makes it easier to understand the code.
- Use comments, and whitespaces around operators and assignments.
- Keep the maximum line length 79 characters.

### 3. What Not to Do while Programming in Python

- Avoid importing everything from a package -
  this pollutes the global namespace and can cause clashes.
- Don’t implement best practices from other languages.
- Do not turn off error reporting during development- turn it off after it.
- Don’t alter sys.path, use distutils for that.

### 4. Use Python 3

- Python 2 is officially not suported from 1 January, 2020.

### 5. Return Multiple Values

- Functions in Python can return more than one variable
  without the need for a dictionary, a list or a class.
  But anything past 3 values should be put into a (data) class.

### 6. Writing Documentation

- Include a README file for describing your project.
- Use the setup.py file for properly setting up your project in a new environment.
- Add the requirements.txt for describing the dependencies that are needed.

## Flask Framework

For this app I used flask framework
because it is simple prod ready framework
suitable for small applications.

### Pros

- Easy to understand: good for beginners and small projects.
- Flexible and easy: almosts all parts of flask are open to change.

### Cons

- Scale: handles only one request at a time.
- Modules: modular work can create security risks.

## Linters

Lint checks are automated in github actions.
They are made on each push and pull requests.

1. For Python was used the [flake8](https://pypi.org/project/flake8/) linter.
1. For Markdown files the
   [markdownlint](https://github.com/markdownlint/markdownlint) tool was used.

## Unit tests

Python app has two unit tests both run from __init__.py file.

1. test_page.py file tests the connection to the server.
1. test_time.py file checks if the app shows the Moscow time.

### Best pracricies

1. Location and naming of test files
   Test files are located in the ```test``` folder.
   Their names start with ```test_``` and then goes
   the tested feature.

1. Tests should not execute for a long time
   Tests execution takes less than 0.1 seconds

1. Test one scenario per test
   Each test checks only one feature
