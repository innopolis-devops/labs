# Python Best Practices

- Use `poetry` for dependency management
  - Provides lock file
  - Provides separation for dev dependencies and production dependencies
  - Resolves version conflicts
- Use pre-commit hooks to lint the files
- Use linters to check for code quality
  - flake8 - code style
  - isort - code formatting
  - black - code formatting
- Use formatting on pre-commit so that the code have unified style
- Use production-ready framework [`fastapi`](https://fastapi.tiangolo.com/)

  > The key features are:
  >
  > - Fast: Very high performance, on par with NodeJS and Go (thanks to Starlette and Pydantic). One of the fastest Python frameworks available.
  > - Fast to code: Increase the speed to develop features by about 200% to 300%.
  > - Fewer bugs: Reduce about 40% of human (developer) induced errors.
  > - Intuitive: Great editor support. Completion everywhere. Less time debugging.
  > - Easy: Designed to be easy to use and learn. Less time reading docs.
  > - Short: Minimize code duplication. Multiple features from each parameter declaration. Fewer bugs.
  > - Robust: Get production-ready code. With automatic interactive documentation.
  > - Standards-based: Based on (and fully compatible with) the open standards for APIs: OpenAPI (previously known as Swagger) and JSON Schema.

- Specify the versions of the packages used
- Do not run production code from root
- Run unit tests doing build time
  - It simplifies the development pipeline
- Use pytest for unittest
  - It's easier to use
  - It allows to collect coverage

## Unit tests

- Tests that the app returns the current time in ISO format
