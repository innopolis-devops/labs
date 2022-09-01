# Used tools and frameworks
## Flask
[**Flask**](https://flask.palletsprojects.com/en/2.2.x/) is a simple and light-weight "microframework" for 
creating web applications on _Python_.

### Pros
 - **Simplicity**
 - Has useful expansions (login, sql, etc.)
 - WSGI compatible
 - Popularity (many guides and examples)
### Cons
 - Provides very basic functionality 
 - Is not scalable
 - Is not secure by default
 - Does not aim for high performance

In my opinion, this framework is the best choice for my small project, which aimed
mostly on practicing DevOps methods, rather than writing complex web applications.

## Jinja2

[**Jinja2**](https://jinja.palletsprojects.com/en/3.1.x/) is template engine for markup documents (HTML, XML, and etc.).

### Pros
 - Integrated with Flask
 - Extensible
 - Popular
### Cons
 - Performance issues with increasing size of pages

Same as above, this is a great tool for my small and simple project.

## Gunicorn

**[Gunicorn](https://gunicorn.org/#quickstart)** is simple WSGI server.

Although, Flask could be natively started as web application, this is not recommended way for the production, 
and used only for debugging.
Official documentation suggests to use other WSGI server and my choice is to use _Gunicorn_.

### Pros
 - Simple
 - Small
 - Production ready
### Cons
 - Not much configuration parameters
 - Not secure (usually requires "reverse proxy" server on top of it)