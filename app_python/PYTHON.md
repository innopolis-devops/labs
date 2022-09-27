# Description of the Python app

## Best practices for Python apps

1. Install packages with `requirements.txt`
2. Virtual environment for a project.
3. Exclude irrelevant files from git with `.gitignore`
4. Linter `pylint` for fixing syntactic and logic bugs.
5. License file to protect the code distribution.

## Framework used

It was decided to use the *Flask* framework for the development.
It allows to build a light web applications from scratch in a fast way.

Its **pros** are:

- Flexible
- Scalable
- Lightweight
- Well-documented

And **cons**:

- Maintenance costs
- Few tools
- Not suitable for large projects

## Tests

The application is tested with unit tests in */app_python/tests*
folder using `pytest` framework.

### Unit tests

The folder contains files *conftest.py* and other files for tests.
The first one is needed to define reusable components for all tests
(see [reference](https://flask.palletsprojects.com/en/2.2.x/testing/)).
Test files contain test cases.

### Best practices

- Examine *only* one feature per test.
- Test file should include only 1 test
and better to be named as *test_TESTNAME*.
- A test should not take too much time to execute.
- A test should produce the same result
no matter how many times it is executed.
- A test should be isolated from other ones.
- A test should be automated.
