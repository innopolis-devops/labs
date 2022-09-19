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

# Best practices for writing Unit tests
My unit tests send request to check is server responds with 200 status code on root page and 404 otherwise.

1. Parametrize your tests. Don't use the same test copy-pasted many times with different inputs. With Pytest you can reduce it to only one test.
2. Make your unit test as small as possible, in a way that the minimum possible piece of code is involved. This way, when an error appears, you will be able to quickly assess where it originated.
3. Try to use Test Driven Development in the project.
4. Treat test code as core code. Make your test code readable, use docstrings and comments and respect style, almost as if it were a part of the functional code base.

## References:
* https://dzone.com/articles/7-best-python-code-review-tools-recommended-by-dev
* https://medium.com/worldsensing-techblog/tips-and-tricks-for-unit-tests-b35af5ba79b1
* https://realpython.com/python-code-quality/
* https://luminousmen.com/post/python-static-analysis-tools
