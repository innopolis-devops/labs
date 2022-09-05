# Python

## Best practices

1. **Use Version Control System (VCS)**. Even though it is impossible to complete the task without using Git,
I generally use VCS in every project of mine.
2. **Write a README file**. The README has general information about the app,
such as how to install and run it.
3. **Have requirements.txt file**. This file contains a set
of dependencies of the application and is essential for someone to run the project.
4. **Compliance with PEP8 code style**. PEP8 is a standard guideline for python code.
5. **Use a linter**. Linters are programs
that assist more readable and error-prone code by analyzing its structure.

## Framework of choice: FastAPI

1. **Small**. This is the main reason why I chose this framework.
It takes a dozen of lines to write a backend app.
2. **Easy**. This is quite essential for an educational project,
as I have no experience with python frameworks.
3. Still **Fast** and **Robust**. Despite the above, it is a production-ready framework
for implementing high-load backend applications.

## Python linter

I used [pylint](https://pypi.org/project/pylint/). It is listed in the requirements.txt,
so you should be able to run it.

```
pylint main.py
```

## Markdown Linter

I used [markdownlint](https://github.com/markdownlint/markdownlint). This file is formatted according to the linter.