# Implementation details

## Python

### Python formatting

Using [`black`](https://github.com/psf/black) PEP 8 compliant formatter. Might be configured as a pre-commit hook, but didn't do that, just ran `black .` before committing.

### Framework choice

The app is written in [FastAPI](https://github.com/tiangolo/fastapi), which is as lightweight as a commonly used Flask, but uses ASGI and offers more advanced features out of the box. Most importantly, it uses type hints a lot, which greatly reduces the amount of errors in the code.

I also like its thorough [documentation](https://fastapi.tiangolo.com) a lot.

## Markdown

### Markdown linting

Using [`vscode-markdownlint`](https://github.com/DavidAnson/vscode-markdownlint) in VS Code with format-on-save feature. Great thing!
