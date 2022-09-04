# Best practices - Golang version

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

## Linters

I use **Flake8** linter because it is the most popular and used one.

I used this command to run the linter:

```python
flake8 main.py
```

For Markdow I decided to use markdownlint as an extension in VSCode
