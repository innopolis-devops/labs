## Best practices

- use VCS (github)
- use codestyle checkers (sonarlint)
- apply principles of Zen of Python
- write dependencies version in requirement.txt
- write unit tests

## Framework

I used `Flask` in my project.  Flask is a microframework for creating and scaling web applications.

The pros of Flask are:

- Flexible. As one of  Zen of Python principle says: 'Simplicity is better than complexity, because it can be easily rearranged and moved around.'
- Scalable. Developers can use Flask microframework to grow a tech project such as a web app incredibly quickly.
- Lightweight. There are few constituent parts that need to be assembled and reassembled, and it doesn’t rely on a large number of extensions to function. This design gives developers a certain level of control.

The cons of Flask are:

- Not a lot of tools. Developers will have to manually add extensions such as libraries. And, if developer add a huge number of extensions, it may start to slow down the app itself due to a multitude of requests.
- Maintenance costs. Because Flask is so versatile in terms of which technologies it can interface with, quite often a company using Flask will incur extra costs of supporting those technologies. For example, if a technology interfacing with your Flask app becomes obsolete or is discontinued, then the company will have to scramble to find a new compatible one. The more complicated the app becomes, the higher the potential maintenance and implementation costs

## Linters

I used `SonarLint`. I chose this linter because I like that it shows not only the place with mistake,
but also shows rules with good and bad example of code style. Also, I like the way it classifies all code mistakes to
Bugs, Code Smells & Security Vulnerabilities.

I used `markdownlint` for Markdown style checking.

## Tests

I took best practices from the book "The Hitchhiker’s Guide to Python"

- A testing unit should focus on one tiny bit of functionality and prove it correct. - I have isolated tests.
- Use long and descriptive names for testing functions. - I named methods descriptively.
- Make test readable and simple.

I use `unittest` module for testing. Its Api is simple and simular to libraries that I have already used (Junit). I also
find about it from the book.

I have one test , which checks that time displayed at website is current time in Moscow.
