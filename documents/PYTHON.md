## Best practices used
1. Use version control system (I use GitHub)
2. Write readable code
3. Generate requirements.txt
4. Project description in the README.md file

## Framework
For this project **Flask** is used
#### Pros:
* Flask is **lightweight**, which is good for not very big projects like this one.
* It is **Scalable**, which is handy in case if this project is going to grow.
* It has a comprehensive **Documentation**.
#### Cons:
* **Not that many tools** compared to Django, for example, which is not that of a big problem for this project as we can manually add extensions such as libraries.
* **Not the fastest** (for example compared to FastAPI), which is not so important for a small project like this.

## Linter

Pylint is used
it is a powerful linter that checks for errors in Python code and tries to enforce a coding standard.

## Tests

For tests pytest is used. test_app.py tests if the app.py works correctly. It checks wherer the response message is 200 OK and whether the data of the responce is in the expected format.

Best practices:
1. naming of the test files. Naming sutifies the convention test_app.py corresponds to testing app.py
2. simplicity of tests.
3. automate tests with ci.yml
4. tests do not duplicate implementations.