
# Used tools and frameworks

## Gin

![](https://miro.medium.com/max/921/1*HtCjHzGwf6iWNqXu5Cndsg.png)

Minimalist web framework for _Golang_.

Pros

* Simplicity
* Popularity
* Performance
* Production ready

Cons

* Not well-suited for large/enterprise apps

## Linters

### Golangci-lint

[Link](https://github.com/golangci/golangci-lint)

Result - 0 issues
![](https://i.imgur.com/Brcc9ho.png)

### Markdown Lint

[Link](https://github.com/markdownlint/markdownlint)

Result - bare URLs in `README.md` (these are localhost ones)
![](https://i.imgur.com/Qgo6oBI.png)

## Testing

### Unit tests

For unit tests I have used standard go library for testing.

Applied **best practices**:

- Usage of framework (do not reimplement the wheel)
- Each test is responsible only for tiny functionality 
(so that each test is fast, simple and helps to find exact reason of failure)
- Used both positive and negative tests (more coverage)

The **first test** checks reachability of main page.\
The **second test** checks unreachability of some missing page/path.
