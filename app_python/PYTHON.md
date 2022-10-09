# Best practices for Python web development

## Application

+ for simple web application, use simple web framework - **Flask**. It's simple, and syncrhonous fast-to-write
+ use wsgi for production, not flask dev server
+ use docker for your application for easy production run
+ use ready .gitignore file from [here](https://github.com/github/gitignore/blob/main/Python.gitignore)
+ use ENV variables to configure your app without rebuilding
+ use simple and fast linter - **Black**
+ use Jinja2 templates, not hard code html code

Also I decided to use [linter](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) for .md files

## Unit test

+ use popular, easy and powerfull framework - **pytest**
+ store tests in `tests/` dir
+ use fixtures, to initiate client instance only once
+ to test app with time, should use mock library to mock `datetime.now()` function - **freezegun**
