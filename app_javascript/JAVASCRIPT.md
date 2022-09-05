# JavaScript best practicies

## 1. Avoid globals

Global variables and function names are an incredibly bad idea.
The reason is that every JavaScript file
included in the page runs in the same scope.
If you have global variables or functions in your code,
scripts included after yours that contain the same
variable and function names will overwrite your variables/functions.

## 2. Stick to a strict coding style

Browsers are very forgiving when it comes to JavaScript syntax.
Use [JSLint](https://www.jslint.com/) to check your code.

## 3. Comment as much as needed but not more

## 4. Use shortcut notation when it makes sense

Shortcut notation is a tricky subject:
on the one hand it keeps your code small
but on the other you might make it hard for developers
that take over from you as they might not be aware of the shortcuts.

## 5. Avoid heavy nesting

Nesting code explains its logic and
makes it much easier to read, however nesting it too far
can also make it hard to follow what you are trying to do.

## React pros and cons

## Pros

- Easy to Learn and Use

ReactJS is much easier to learn and use.
It comes with a good supply of documentation,
tutorials, and training resources.

- Creating Dynamic Web Applications Becomes Easier

To create a dynamic web application specifically
with HTML strings was tricky because it requires a complex coding,
but React JS solved that issue and makes it easier.

- Performance Enhancement

ReactJS improves performance due to virtual DOM.
The DOM is a cross-platform and programming API
which deals with HTML, XML or XHTML.

## Cons

- The high pace of development

The high pace of development has an advantage and disadvantage both.
In case of disadvantage, since the environment continually changes so fast,
some of the developers not feeling comfortable to relearn
the new ways of doing things regularly.

- Poor Documentation

It is another cons which are common for constantly updating technologies.

## Linters

Lint checks are automated in github actions.
They are made on each push and pull requests.

- For JavaScript was used the
[eslint](https://eslint.org/) linter.

- For Markdown files the
[markdownlint](https://github.com/markdownlint/markdownlint)
tool was used.
