
# Python best practices

The following is a list of best practices for Python that are being followed in this project:

## Coding

- Using Flask since it is a mature web development framework, and it allowed us to complete this simple application in a minimal amount of code, eventhough it's not suitable for big applications, but it's flexible to use in our application 
- Use a linter/formatter such as [black](https://pypi.python.org/pypi/black) to enforce consistent, PEP8-conforming styles.
- Use `if __name__ == "__main__":` to ensure that the code is only executed when the module is run directly.
- Use virtual enviroments (created using `python -m venv`) to isolate dependencies.
- Save the dependencies in a `requirements.txt` file (using the output from `pip freeze`).
- Use lowercase (snake_case) for all identifiers.
- Do NOT use `from module import *` imports.
- Be consistent with the style of the rest of the codebase.
- Avoid using legacy syntax (such as `%`-formatting).
- Order imports as follows (and separate them with a single line):
  - Standard library imports
  - Third-party library imports
  - Local application/library specific imports



## Testing

- Use [pytest](https://docs.pytest.org/en/latest/) to test the application.
- Create a `tests` directory and a `test_` file for each test.
- Follow the [Given-When-Then](https://martinfowler.com/bliki/GivenWhenThen.html) style of writing tests.
- Separate between unit and functional tests.
- Try to maximize test code coverage to ensure that the application is tested thoroughly.
- Do not modify the application code in tests.
- Parametrize when asserting the same behavior with various inputs and expected outputs (do not depend on global state).
- Never manually create `Response` objects for tests.

## Endpoints

- `/`: Displays the current time in Moscow.
- `/visits`: Displays the number of visits to the app.


### References
- https://www.twilio.com/docs/usage/tutorials/how-to-set-up-your-python-and-flask-development-environment
- https://www.python.org/dev/peps/pep-0008/
- https://flask.palletsprojects.com/en/2.0.x/testing/
- https://testdriven.io/blog/flask-pytest/
- https://www.nerdwallet.com/blog/engineering/5-pytest-best-practices/
