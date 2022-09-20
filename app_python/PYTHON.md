# Python web app

## Best practices used

* README
  * README file created with project description and setup
* requirements.txt
  * Created ```requirements.txt``` file which the modules and dependencies of the project- the things it will not run without.
* Documentation
  * Create docs folder with documentation of the project
* Follow Style Guidelines
  * Followed PEP8 code style for python and enforced it using [Black](https://github.com/psf/black)
* Write Readable Code

## Framework used : [Flask](https://flask.palletsprojects.com/)

### Pros

* Scalable
  * Can start small but also able to grow if the project demands it. Good for when the scale of the project is not known yet.
* Lightweight
  * Does not depend on many extentions to work.
* Flexible
  * Can be easily changed and moved around.

### Cons

* Not a lot of tools
  * Due to it's lightweightness, it lacks functionality that the developer might have to add themself.
* Maintenance costs
  * Because it is so versatile in terms of which technologies it can interface with, quite often extra costs will be incurred of supporting those technologies when using Flask.

## Testing best practices

* Use [pytest](https://docs.pytest.org/en/latest/) to test the application.
* Create a `tests` directory and a `test_` file for each test, mimicking the directory structure of the application.
* Follow the [Given-When-Then](https://martinfowler.com/bliki/GivenWhenThen.html) style of writing tests.
* Make sure tests are fast.
* Insure simplicity in tests.
* Test shouldn’t duplicate implementation logic.
* Separate between unit and functional tests.
* Use fixtures to provide common setup and teardown code.
* Try to maximize test code coverage to ensure that the application is tested thoroughly.
* Do not modify the application code in tests.
* Do not modify fixtures in other fixtures.
* Never manually create `Response` objects for tests.

## Linters

### Python : [PyLint](https://pypi.org/project/pylint/)

### Markdown : [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
