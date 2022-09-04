# Best practices that I applied

- Add unnecessary generated files in `.gitignore` to not accidentally push them.
- Separate logic by different functions instead of writing everything
  in the main function
- Move functionality into separate files to follow the MVC paradigm
- Write unit tests for implemented functions
- Follow PEP 8 code style standard
- Use PyLint linter for python code static analysis
- Use Markdown lint to check markdown files

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

## Linters

- to check the Python code I used [PyLint](https://pypi.org/project/pylint/)
   - Install: `pip install pylint`
   - Check: `pylint main.py`

- to check markdown files I used
  [Markdown lint](https://github.com/markdownlint/markdownlint) tool
   - Install: `rake install`
   - Check: `mdl README.md`
