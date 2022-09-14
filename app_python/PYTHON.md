# Python-specific info

## Best practices

* Created virtual environment not to install all requirements in local python installation and for better requirements.txt generation
* Added [.gitignore](https://github.com/github/gitignore/blob/main/Python.gitignore) file recommended for python
* Created requirements.txt so that users can install the requirements in order to run the app
* Wrote configuration for docker image, so that users won't need to create venv, install dependencies, etc. manually
* Used `gunicorn` WSGI server (as adviced for production use with flask)
* Passed the code through [Black](https://github.com/psf/black) python linter and `.md` files through [Markdown linter](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

## Framework choice

I chose Flask framework with Gunicorn HTTP server because consensus of all developers opinions in the Internet is that it is production-ready.

### Pros

* Simple
* Production-ready
* Enough for us

### Cons

* None for this purpose (and compared to other frameworks)

## (✨New✨) Unit tests

### Description

Since it is a simple one-page web app, there is not a lot of code (thus we won't have lots of tests). Viable functionality to test are time formatting and page render. Since render can vary a lot, I only check if it at least contains the required time.

### Best practices

* Repeatable tests
* Test one small functionality
