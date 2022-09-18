## Python Web Application

### Framework

I decided to use [Flask](https://flask.palletsprojects.com/en/2.2.x/) framework. I chose exactly this one because of several reasons:
* This framework is very easy to use.
* It is flexible.
* With Flask, our project's code always consists only of what we put in it, with no unnecessary code responsible for features you don’t use.
* Documentation

But nevertheless this framework has some **disadvantages** as well:
* More complicated maintenance for larger implementations
* More potential for security risks
* Higher maintenance costs for more complex systems

### Best practices

* Following style guidelines. For example, The [PEP8](https://peps.python.org/pep-0008/) holds some great community-generated proposals.
* Usage of Virtual Environments.
* Usage of `.gitignore ` to ignore unnecessary files while committing and pushing.

### Linters for Python and Markdown

For python I used [PEP8](https://peps.python.org/pep-0008/) and [PyFlakes](https://pypi.org/project/pyflakes/). 

For markdown I used [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli)

### Unit testing

Unit test is a software development process in which the smallest testable parts of an application, called units, are individually and independently scrutinized for proper operation.

In my application for unit testing I used [pytest](https://docs.pytest.org/en/7.1.x/).

My first unit test checks that my web-application actually works and shows the right message to user.

#### Best practices that I applied for unit testing
1) **Use of fixtures.** Fixtures are how test setups (and any other helpers) are shared between tests. While we can use plain functions and variables as helpers, fixtures are super-powered with functionality, including:

* The ability to depend on and build on top of each other to model complex functionality
* The ability to customize this functionality by overriding fixtures at various levels
* The ability to parametrize (that is, take on multiple values) and magically run every dependent test once for each parameterized value.

2) **Don’t modify fixture values in other fixtures**. Modify and build on top of fixture values in tests; never modify a fixture value in another fixture – use deepcopy instead.
3) **Prefer responses over mocking outbound HTTP requests**. Never manually create Response objects for tests; instead use the responses library to define what the expected raw API response is.