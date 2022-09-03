# Python best practices

- For simple web applications, I use Flask - it's fairly self-explanatory and extends well with plugins and decorations
- I think flake8 is a good linter for Python language
- For application delivery, I prefer to use only containerization (without deprecated Docker)
- Specify the full name of image and its tag
- In order to make the repository look clean and tidy, I applied the gitignore [file](https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore)
- Don't use pip freeze to save dependencies - resolve them manually
