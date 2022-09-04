# Best practices for Python apps

1. Use tools for dependencies or at least `requirements.txt` file for Python packages.
2. Use `.gitignore` file to exclude not relevant files from the git.
3. Use virtual environment for each project to not mess all packages and their versions in the system. 
But do not create them in docker containers, because it is waste of resources.
4. Use linters to fix mistakes, stylistic inconsistencies, dangerous logic, to detect not used imports, etc.
* [pylint](https://pylint.org)
* [pyflakes](https://github.com/PyCQA/pyflakes)
* [pycodestyle](https://github.com/PyCQA/pycodestyle)
5. Use static analysis tools to easily detect vulnerabilities or some problems:
* [pylint](https://pylint.org)
* [pyflakes](https://github.com/PyCQA/pyflakes)
6. Use formatting tools:
* [black](https://github.com/psf/black)
* [isort](https://github.com/PyCQA/isort)
