# Best practices with Python
1. Create Readable Documentation to make it easier to navigate through the project

    For this, I used **Markdown**
2. Follow Style Guidelines to have a uniform code

    The **PEP8** holds some great community-generated proposals
3. Use Virtual Environments for each project you create to avoid any library clashes, since different projects may need different versions of a certain library
4. Use tools for dependencies management or have a `requierements.txt` file to keep those

    I used **poetry** to keep track on dependencies
5. Use linters to improve code quality, for example:
    * [**Pylint**](https://pylint.org)
    * [PyFlakes](https://github.com/PyCQA/pyflakes)
    * [pycodestyle](https://github.com/PyCQA/pycodestyle) (formerly pep8)
6. Use static code analysers to detect vulnerabilities, for example:
    * [**Pylint**](https://pylint.org)
    * [PyFlakes](https://github.com/PyCQA/pyflakes)

## Unit Tests
1. Write readable, simple tests
2. Make your tests as small as possible
3. Write deterministic tests, that is a test that presents the same behavior as long as the code remains unchanged
4. Parametrize your tests. Don't use the same test copy-pasted many times with different inputs
