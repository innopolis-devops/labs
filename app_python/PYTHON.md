# Technology stack explained

## Best Practises

* added **.gitignore** to store only necessary files in git
* **docker** wasn't used as it will be added as a part of 2nd lab task
* used **virtualenv** for development: [Gunicorn](https://flask.palletsprojects.com/en/2.2.x/deploying/gunicorn/)

## Python framework

For this particular project I have chosen Flask framework

### Pros

* **Scalable** (Flask’s status as a microframework means that you can use it to grow a tech project such as a web app incredibly quickly)
* **Flexible** (minimal nature of Flask and its aptitude for developing smaller web apps means that it’s even more flexible than Django itself)
* **Easy to negotiate** (microframework is easy to understand for web developers, not just saving them time and effort but also giving them more control over their code)
* **Lightweight** (there are few constituent parts that need to be assembled and reassembled, and it doesn't rely on a large number of extensions to function)

### Cons

* **Small amount of tools** (developers will have to manually add extensions such as libraries)
* **Difficult to get familiar with a larger Flask app** (development of a web app using Flask can take a variety of twists and turns, a web developer arriving to the project midway through can struggle to come to terms with how it’s been designed)
* **Maintenance costs** (Because it is so versatile in terms of which technologies it can interface with, quite often a company using Flask will incur extra costs of supporting those technologies)

## Linting

### Python code

For this project I configured and used **Pylint** module as it is one of the simplest and effective linters for python applications

### Markdown

As **Markdown linter** I used pycharm plugin **Markdown**

## Testing

For this application I used [PyUnit](https://docs.python.org/3/library/unittest.html) which is a 
Python’s built-in unit testing framework and Python’s version of the corresponding JUnit testing framework for Java.

### Best Practices

* **tests** directory added with separate `__init__.py` file to run tests from outside of current folder
* only necessary imports are present inside tests
* no _"overtesting"_ as only single `current_time()` method was tested for proper work