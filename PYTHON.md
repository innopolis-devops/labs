# Best practices - Python version

## Technology Stack

I used **FastAPI** - production-level framework because:

- It's lightweignt and easy to use and deploy. This is a good chocie for this small web application
- You can generate Swagger autodocumentation
- We use it in our company and we know that this framework works well in practice

I used **Uvicorn** as ASGI server because

- It is lightweight and easy-to-use
  
## Other Decisions

I've  used requirements.txt file to manage all project dependencies

I've used virtual environments (using venv) to make sure that all dependencies will work on any machine

## Tests

1. I used built-in TestClient for FastAPi
2. I used fixtures from pytest
3. Nothing specific is written for the tests

I recieve response from server, assert that format is correct and then assert that difference between current local time and time returned by server is less than 10 seconds.

To run tests, just run ``pytest`` command

## Linters

I use **Flake8** linter because it is the most popular and used one.

I used this command to run the linter:

```python
flake8 main.py
```

For Markdown I decided to use markdownlint as an extension in VSCode
