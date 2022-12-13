# 1. Flask Best practices
- Use Production ready web-framework - `Flask`
- Use popular python linter - `pylint`
- List all dependencies and their version for reproducible builds - detailed in `requirements.txt`
- Run production WSGI server (Gunicorm) instead of Flask dev server
- Allow to configure the app using environment variables, as recommended by the  twelve factor app
- Containerize application using Docker containers
- Use Jinja templates instead of hardcoding html strings in the source code
- Include .gitignore for skipping irrelevant files in the Git VCS
- Include .dockerignore for reducing docker context size

# 2. Framework
This application is built using Flask.

<img src="./images/flask-logo.png" width="100"/>

## 2.1 Why this framework
## 2.2 Pros & Cons of the framework
## Pros
- &#9989;&nbsp; Highly Scalable <br />
>The reason behind the scalable nature of Flask is its ability to modularize the codebase as it grows over a specific period. It allows developers to segregate them as chucks.

- &#9989;&nbsp; Easy to Use and Flexible
> the framework is straightforward to use and understand, even for a newbie. The primary reason behind the simplicity of Flask is its documentation that becomes handy for developers in case of confusion.

- &#9989;&nbsp; Greater Control Over Codes
>The framework enables developers to choose the components they want for a specific application. Moreover, Flask empowers developers to make decisions while selecting the components for development.

- &#9989;&nbsp; Support for Testing
>Flask provides an in-built unit testing facility that enables you to test your app before making it live in production. In addition, the framework provides features such as a built-in development server, a fast debugger, and restful request dispatching.

- &#9989;&nbsp; Facilitates Experimentation
>Flask enables you to adapt to emerging technologies and work through agile development methodologies. Faster implementation is one of the USPs of the Flask framework, and that’s why it made its name among the Python community.

## Cons 
- &#10062;&nbsp; More potential for security risks
- &#10062;&nbsp; Slower MVP development in most cases
- &#10062;&nbsp; Higher maintenance costs for more complex systems
- &#10062;&nbsp; More complicated maintenance for larger implementations

# 3. Unit tests best practices

- Use popular testing framework (e.g. pytest)
- Use fixtures to create dependencies
- Use `conftest.py` for all fixtures