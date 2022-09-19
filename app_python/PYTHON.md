
# Used tools and frameworks

## Flask

[**Flask**](https://flask.palletsprojects.com/en/2.2.x/) is a simple and
light-weight "microframework" for
creating web applications on _Python_.

Pros

- **Simplicity**
- Has useful expansions (login, sql, etc.)
- WSGI compatible
- Popularity (many guides and examples)

Cons

- Provides very basic functionality
- Is not scalable
- Is not secure by default
- Does not aim for high performance

In my opinion, this framework is the best choice for my small project, which aimed
mostly on practicing DevOps methods, rather than writing complex web applications.

## Jinja2

[**Jinja2**](https://jinja.palletsprojects.com/en/3.1.x/)
is template engine for markup documents (HTML, XML, and etc.).

Pros

- Integrated with Flask
- Extensible
- Popular

Cons

- Performance issues with increasing size of pages

Same as above, this is a great tool for my small and simple project.

## Gunicorn

**[Gunicorn](https://gunicorn.org/#quickstart)** is simple WSGI server.

Although, Flask could be natively started as web application, this is not
recommended way for the production, and used only for debugging.
Official documentation suggests to use other WSGI server
and my choice is to use _Gunicorn_.

Pros

- Simple
- Small
- Production ready

Cons

- Not much configuration parameters
- Not secure (usually requires "reverse proxy" server on top of it)

## Linters

### Pylint

Simple linter for python

![](https://i.imgur.com/HIosGtc.png)
_Missing documentation issues only_

### Djlint

Linter for jinja templates

![](https://i.imgur.com/WR8xYFN.png)
_Result_

### Markdown linter (mdl)

[MarkdownLint](https://github.com/markdownlint/markdownlint)

![](https://i.imgur.com/ZIXXb9O.png)
_Result for both PYTHON.md and README.md_

## Testing

### Unit tests

For unit tests I have used standard python library - unittest.

This is simple and lightweight built-in framework for unit-testing which does not require additional dependencies.

Applied **best practices**:

- Usage of framework (do not reimplement the wheel)
- Set up stage for tests that require this step
- Each test is responsible only for tiny functionality 
(so that each test is fast, simple and helps to find exact reason of failure)
- Used both positive and negative tests (more coverage)
- Usage of test-client provided by **Flask** framework

The **first test** checks the formatting of `get_current_moscow_time` output.\
The **second one** checks reachability of main page.\
The **third test** checks unreachability of some missing page/path.
