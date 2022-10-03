## Best practices

1. Create a Code Repository and Implement Version Control
2. Create Readable Documentation
3. Follow Style Guidelines


## Flask Framework

Flask Framework is a python microframework. A good Flask
example is it is used by LinkedIn and Pinterest.

Pros:
* It includes a built-in development server, and unit-testing support.
* It is also fully Unicode-enabled with RESTful request-dispatching and 
WSGI compliance.
* Easy to manage due to its size. It does not need any tools or libraries.
Flask will be useful when you want to develop small, simple applications.
* With it, you can operate your database however you like- using SQLAlchemy or whatever.
* I have experience working with Flask.

Cons:
* Not rich functionality.
* It has no database abstraction layer or form validation. Can be added
as extensions.


## Linter

Basic linter - python-app linter

check dependencies and code style by flake8

I chose it because nothing needs to be configured in yml file, by that I mean
github already suplies with ready template


## Unit Testing Best Practices
A unit test validates and verifies individual software units (or components) to ensure each unit works as intended. A unit may be a function, procedure, method, object, or module. Unit testing occurs during the coding phase of the software development lifecycle, and can help identify coding errors, code quality issues, and security issues.

* Write Readable, Simple Tests (AAA).
Unit test library has specific convention of defining test, which follows AAA. I was using pytest
and I think I could keep the simplicity.
* Write Deterministic Tests.
Test scenarios cannot have different outcomes, either one state or other.
* Test One Scenario Per Test.
In test_logic.py test were made for on particular scenario.
* Unit Tests Should Be Automated.
I have CI configured to run tests
* Write Isolated Tests.
The state of one test does not disturb others.
* Avoid Test Interdependence.
Kind of same idea.
* Ensure Unit Tests are Repeatable and Scalable.
The test scenarios can be scaled.
* Write Good Test Names.
Test names indicate which particular field is tested.