# Rust-specific info

## Best practices

* Added [.gitignore](https://github.com/github/gitignore/blob/main/Python.gitignore) file recommended for rust
* Wrote configuration for docker image, so that users won't need to create venv, install dependencies, etc. manually
* Passed the code through [Clippy](https://github.com/rust-lang/rust-clippy) rust linter (widely used in Rust development) and `.md` files through [Markdown linter](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

## Framework choice

I chose Rocket Rust framework because Rust is a go-to option for network applications (memory safety, strict compiler policy, etc.) and Rocket is a framework that gets needed work done.

### Pros

* Simple
* Production-ready
* Enough for us

### Cons

* Version used is a "Release candidate", which is not the best option for production server. However, we are not expected to maintain the server (it's basically hello world), so it should work for us.
