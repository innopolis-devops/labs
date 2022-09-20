# Road to production ready application

## Best pracices applied

Best practices were retrieved from <https://go.dev/talks/2013/bestpractices.slide#1>
and <https://golangdocs.com/golang-best-practices>

1. Avoiding nesting by handling errors first
2. Important code goes first
3. Avoiding repetitions with utilities
4. Use Go Modules
5. Version Control System - Git
6. Use linters - golangci

## Why Gin?

The Gin framework was choosen because of its simplicity,
high development speed,
extensive and detailed documentation,
suitability for building APIs.

It is production ready framework:

1. 98% test coverage
2. Constantly improving framework
3. Constantly growing community
4. High performance

Pros of Gin:

1. Everything stated above in the section
2. Simple to deal with
3. Open source
4. The most popular GO framework
5. Suitable for building REST APIs.
6. Suitable for building microservices.

Cons of Gin:

Not found.

## Linters and formatters

For GO code were used:

1. Linter [golangci-lint](https://golangci-lint.run/usage/install/):

    `` $ golangci-lint run . ``

2. Default GO formatter [gofmt](https://pkg.go.dev/cmd/gofmt):

    `` $ gofmt -w <filename> ``

For Markdown were used:

1. [markdownlint](https://github.com/igorshubovych/markdownlint-cli)
and respective [VSCode plugin](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint):

   ``markdownlint <filename>``

## Unit tests

The code is tested with 2 scenarios:

1. Correct response with correct time to correct request
2. 404 Error to invalid request

## Unit tests best practices

1. Tests Should Be Fast
2. Tests Should Be Readable
3. Tests Should Be Deterministic
(I have patched time.Now function to freeze the time)
