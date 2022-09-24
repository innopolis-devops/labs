## FrameWork
I decided to use FastAPI production ready framework, because of following pros:

- it very easy to start with. You do not need to create heavy project for nothing, all web application is placed on 10 lines of code 
- it has ready to use api documentation

For the ASGI web server I used uvicorn

## Other Best Practices
The list of practices that I used:

- create virtualenv
- automatically generate gitignore
- generate requirements.txt

## Linter
I decided to use Flake8 linter for python, because it combines the following linters:

- PyFlakes
- pycodestyle (formerly pep8)
- Mccabe

This linter detecting both logical and stylistic lint. Usage of flake8 linter:
flake8 main.py


For Markdow I decided to use markdownlint as an extension in VSCode