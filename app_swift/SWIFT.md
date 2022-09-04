# About best practices

## Web application in Swift

It did not take me long to choose a framework for a web application, because the strongest and most stable Swift framework is [Vapor](https://vapor.codes).

Here are some best practices that have come in handy for me when developing a web application in Swift:

- Use `.gitignore` to avoid bringing extra files into the repository (such as build files).

- Use [Leaf](https://docs.vapor.codes/leaf/overview/) to generate HTML templates in Vapor.

- Use [Docker](https://www.docker.com) to have and provide the ability to quickly run the service on any computer.

- Use `.dockerignore` to avoid bringing extra files into the container (such as markdown files).

## Linters

- As a linter for Swift, I chose the most popular tool [SwiftLint](https://github.com/realm/SwiftLint), which I use daily myself. I created a configuration file `.swiftlint.yml` to specify the linting parameters.

- As a linter for markdown, I chose `markdownlint`, which has a handy extension for my development environment and is very popular.
