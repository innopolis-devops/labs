## Best practices
* Created virtual environment not to install all requirements in local python installation and for better requirements.txt generation
* Added [.gitignore](https://github.com/github/gitignore/blob/main/Python.gitignore) file recommended for python
* Created requirements.txt so that users can install the requirements in order to run the app
* Wrote configuration for docker image, so that users won't need to create venv, install dependencies, etc. manually

## Framework choice

I chose Flask framework with Gunicorn HTTP server because consensus of all developers opinions in the Internet is that it is production-ready.

### Pros
* Simple
* Production-ready
* Enough for us

### Cons
* None for this purpose (and compared to other frameworks)
