# Road to production ready application

## Best practices

The following list of best practices was used to create the application:
1. Version Control System - Git
2. Readable documentation - README, code comments
3. Following code style guidelines - PEP8
4. Use the PyPI instead of doing it yourself
5. Following The Zen of Python
6. Readable code
7. Using virtual environment
8. Using linters - flake8

## Why Flask?
Flask is a lightweight and flexible web framework that is widely used in production systems due to its simplicity and versatility. Here are some pros and cons of using Flask in a production system:

Pros:
- Lightweight and flexible: Flask is a lightweight framework with a small codebase and few dependencies. It allows developers to build simple or complex web applications with minimal overhead and without being forced into a rigid structure.
- Large and active community: Flask has a large and active community that contributes to the development of plugins, extensions, and libraries, which can be easily integrated into the Flask application.
- Easy to learn: Flask has a simple and intuitive API that is easy to learn, making it a good choice for developers who are new to web development.
- Supports different data stores: Flask can work with a variety of data stores including SQL, NoSQL, and other databases. This makes it easy to integrate with different technologies and services.
- Extensible: Flask is an extensible framework that can be extended using various plugins and libraries. This makes it easy to add new features and functionality to an application.

Cons:
- Lack of structure: Flask does not enforce a rigid structure on the application, which can lead to problems if the application becomes too complex or if multiple developers are working on the project.
- Limited built-in features: Flask has a limited set of built-in features compared to other web frameworks, which can lead to developers having to write more code to implement certain features.
- Security: Flask provides basic security features, but developers are responsible for implementing and maintaining security in their application.
- Performance: Flask is a lightweight framework, but it may not be the best choice for high-performance applications that require high-speed data processing and handling.
- Scalability: Flask is not designed to handle large-scale applications with high traffic and may require additional configuration and optimization to scale well.

In summary, Flask is a great choice for small to medium-scale applications that require flexibility and simplicity, but it may not be the best choice for large-scale, complex, and high-performance applications that require strict structure and robust security features.

## Linters and formatters

For Python code were used:

1. Linter [Flake8](https://pypi.org/project/flake8/):

   ``$ flake8 <file_name>``

2. Formatter [autopep8](https://pypi.org/project/autopep8/):

   ``$ autopep8 --in-place --aggressive <filename>``

## Unit tests

The code is tested with 2 scenarios:

1. Correct response with correct time to correct request
2. 404 Error to invalid request

## Unit tests best practices

1. Tests Should Be Fast
2. Tests Should Be Readable
3. Tests Should Be Deterministic
4. Parametrize the same behavior
