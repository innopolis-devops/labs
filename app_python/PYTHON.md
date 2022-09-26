# Best practices that I applied

- Add unnecessary generated files in `.gitignore` to not accidentally push them.
- Separate logic by different functions instead of writing everything
  in the main function.
- Move functionality into separate files to follow the MVC paradigm.
- Place application files in a separate folder to not make a mess in a root folder.
  In my case, I placed them into [/app](app).
- Place application files in a separate folder to not make a mess in a root folder.
  In my case, I placed them into [/tests](tests).
- Write unit tests for implemented functions.
- Follow PEP 8 code style standard.
- Use PyLint linter for python code static analysis.
- Use Markdown lint to check markdown files.

## FastAPI

I chose this framework since it is considered one of the fastest.

### Pros

- It is lightweight compared with Django and Flask
- It is supported by the lightweight unicorn server
- Lightweight framework and server require fewer machine resources
  and provide fast performance at the same time!
- Easy to implement API
- Integration with OpenAPI, GraphQL and OAuth 2.0

### Cons

- It is a modern framework which has not a lot of guidelines at this moment
- the `main.py` file might become very huge since everything should be tied in there
- has lower packages than Django

## Unit tests

- For unit tests, I chose the `unittest` library since it's convenient for me.
- To run all tests just cd into the **app_python** folder and use this command:
  `python -m unittest discover tests`
- I placed simple unit tests in
  [test_msk_time_unit.py](tests/test_msk_time_unit.py) file and one integration
  test in [test_msk_time_integration.py](tests/test_msk_time_integration.py) file.
  They check the Moscow Time retrieving: time interval
  (that time is really updated each second) and HTML web page content.
- **Best practices**
   - Separate unit and integration tests.
   - All files should be named starting with the `test` prefix.
     Otherwise, `unittest` won't discover them.
   - Put `__init__.py` file for `unittest`
   - Each unit test file should test only a particular module.
     E.g. my unit tests check the Moscow time. Other functionalities checking
     will be in separate files.
   - Place test files into a separate folder. In my case, it is the `/tests` folder.
   - A testing unit should focus on one tiny bit of functionality and prove it correct.
   - Each test unit must be fully independent.
   - Always run the full test suite before a coding session.
   - Use long and descriptive names for testing functions.
   - [Source](https://docs.python-guide.org/writing/tests/)

## Linters

- to check the Python code I used [PyLint](https://pypi.org/project/pylint/)
   - Install: `pip install pylint`
   - In a root directory, run: `pylint --ignore=venv app_python`

- to check markdown files I used
  [Markdown lint](https://github.com/markdownlint/markdownlint) tool
   - Install: `rake install`
   - Check: `mdl app_python`
