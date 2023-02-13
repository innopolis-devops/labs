## Python Best Practices

______________________________________________________________________

1. **Implementing Version Control**. Use technologies such as GitHub
   to control versions of your app.
1. **README**. Create understandable description for your project,
   to help people run it correctly.
1. **requirements.txt**. Create file with needed modules and dependencies
1. **Style Guidelines**. Prefer using Python Enhancement Proposals(PEP),
   since it is standards used by most of the programmers and it helps
   to make python code look and feel the same.
1. **Linter**. Linters help to inspect your code and
   check the guidelines following

## Flask framework

______________________________________________________________________

#### Description:

Flask is a lightweight Web Server Gateway Interface (WSGI) web application framework.
A micro web framework that has minimal dependencies on external libraries, written in Python, which was formed for a faster and easier use, and also has the ability to scale up to complex applications.

#### Pros:

- **Easy to use**. According to big number of sources Flask is much
  easier than its analogues, such as Django, so it takes less time to understand
  it and use in projects.
- **Testing**. Using Flask for web development allows for unit testing through its
  integrated support, built-in development server, fast debugger, and restful request dispatching.
- **Flexibility**. There are very few parts of Flask that cannot be easily and safely altered because of its simplicity and minimality.

#### Cons:

- **Modules**. Flask works with a lot of modules, but
  we can't be sure that all of them will be sustainably updated after
  time. So, in long-term it might increase production costs.
- **Community**. Flask has smaller community in comparison with
  analogue, such as Django, so it there might not be many active users to answer the questions.
- **Big Apps Problems**. When you have a big project, using Flask could be time-consuming. It is suitable only for small-scale applications.

## Python Linter

______________________________________________________________________

I have used [pylint](https://pylint.pycqa.org/en/latest/) linter in my project and got **8.00/10** on first run,
due to lack of docstrings. To check it, you can run:

```
pylint server.py
```

## Markdown Linter

______________________________________________________________________

I have used [mdformat](https://github.com/executablebooks/mdformat) linter
for markdown

## Unit Test Best Practices

______________________________________________________________________

1. **Write clear and understandable test names**. It should
   be clear what your test does.
1. **Arrange, Act, and Assert(AAA)**.
   The AAA protocol is a recommended approach for structuring unit tests.
   You can use the AAA protocol to structure your unit tests with the following steps:

- Arrange: Arrange the setup and initialization for the test
- Act: Act on the unit for the given test
- Assert: Assert or verify the outcome

3. **Use TDD**. Test-Driven development means that tests should
   be written before/during development.
1. **One use case per test**. Each test should focus on a single use case, and verify the output is as expected for that tested method.
1. **Aim for maximum test coverage**. More tests - less chance of problem or error on produc tion.
1. **Use automation for tests**. You should set up an automated process for unit testing on a daily or hourly basis or through a CI/CD process.
