
# Framework #

I decided to use Flask framework, because of following pros:

* Lightweight: It is a lightweight framework as it is independent of external libraries. It gives a quick start to the web development process of complex applications.
* Independent: Flask gives independent or full control to the developer for creating applications. You can experiment with the architecture or the libraries of the framework.
* Integrated Unit Testing: Flask’s integrated unit testing system enables faster debugging, robust development, and freedom to experiment.
* Secure Cookies: Secure cookie is an attribute of an HTTP request that enables the security of channels and ensures no unauthorized person has access to the text. Flask supports the feature of secure cookies.
* Compatible: Flask is compatible with the latest technologies like Machine Learning, Cloud, etc.
* Flexible and Scalable: Support WSGI templates that allow flexibility and scalability for web applications.
* It comes with a built-in server and debugger.
* Simple and adaptable configurations.

# Best practices #

* Use .gitignore file
* Create virtual environment
* Generate requirements.txt
* Describe project in README

# Linter #

I use **Flake8** linter for Python and **markdownlint** for a Markdown


# Unit tests #

I have only one unit test. I followed several best practices:

* Clear test function name: The name of the test function, test_get_time, is clear and descriptive. It conveys the intent of the test and what it's testing.
* Arrange-Act-Assert (AAA) structure: The test function follows the AAA structure, where we first set up the necessary objects (arrange), then perform the action being tested (act), and finally check the expected result (assert).
* Isolation of code under test: The test only tests the behavior of the get_time function and does not rely on any external resources or dependencies.
* Use of test client: I use Flask's test client to simulate requests to our app, instead of making actual HTTP requests. This makes our tests faster and more reliable.
* Use of assertions: I use assert statements to check that the actual results match our expected results. This makes it easy to identify when a test fails and what went wrong.

Overall, these practices help make our tests more readable, maintainable, and reliable.
