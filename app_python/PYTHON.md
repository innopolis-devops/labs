# Best practices for Python web development

+ for simple web application, use simple web framework - **Flask**. It's simple, and syncrhonous fast-to-write
+ use wsgi for production, not flask dev server
+ use docker for your application for easy production run
+ use ready .gitignore file from [here](https://github.com/github/gitignore/blob/main/Python.gitignore)
+ use EVN variables to configure your app without rebuilding
+ use simple and fast linter - **Black**
+ use Jinja2 templates, not hard code html code

Also I decided to use [linter](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) for .md files
