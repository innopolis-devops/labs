
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


### References
- https://www.twilio.com/docs/usage/tutorials/how-to-set-up-your-python-and-flask-development-environment
- https://www.python.org/dev/peps/pep-0008/
- https://www.nerdwallet.com/blog/engineering/5-pytest-best-practices/
