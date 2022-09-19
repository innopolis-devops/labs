# Python Best Practicies

* Follow style guidlines - refer to the
 [PEP8](<https://peps.python.org/pep-0008/>) convetions when writing code.

* Write Readable Code:

  * Use line breaks and indentations.
  * Use naming conventions for identifiers.
  * Use comments, and whitespaces around operators and assignments.
  * Keep the maximum line length 79 characters.
  * Avoid importing everything from a package
  * Don’t alter sys.path, use distutils for that.

* Writing Documentation
  * Include a README file for describing your project.
  * Add the requirements.txt for describing the dependencies that are needed.

## Flask Framework

It is used primarily to develop minimalistic web applications and Rest APIs.

### Pros

* Easy to build scalable applications.
* Has great flexibility.

### Cons

* Lack of support for asynchronicity - third party libraries are used
* Usage of the third-party modules increases risk of security breaches

## Linters

Lint checks are automated in github actions. They are made on each push and
pull requests.

* For Python was used the [flake8](https://pypi.org/project/flake8/) linter.
* For Markdown files the
  [markdownlint](https://github.com/markdownlint/markdownlint) tool was used.

## Tests

Added unit test compares actual time in moscow and the time that application
displays. If difference is more than 3 seconds, test is failed

### Best practices

* Make tests run fast
* Run a single test case
