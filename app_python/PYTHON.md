# Python best practices

* Use virtual environments to avoid dependency mess in the system
* Use the ```requirements.txt``` file, which contains all the required dependencies
* Use the ```.gitignore``` file to keep your repository clean
* Use one of the linters to keep your codebase clean (I used ```flake8```)
* Use a production ready framework (I used [`fastapi`](https://fastapi.tiangolo.com/))
    - The key features are:
        - Fast: Very high performance, on par with NodeJS and Go (thanks to Starlette and Pydantic). One of the fastest Python frameworks available.
        - Fast to code: Increase the speed to develop features by about 200% to 300%. *
        - Fewer bugs: Reduce about 40% of human (developer) induced errors. *
        - Intuitive: Great editor support. Completion everywhere. Less time debugging.
        - Easy: Designed to be easy to use and learn. Less time reading docs.
        - Short: Minimize code duplication. Multiple features from each parameter declaration. Fewer bugs.
        - Robust: Get production-ready code. With automatic interactive documentation.
        - Standards-based: Based on (and fully compatible with) the open standards for APIs: OpenAPI (previously known as Swagger) and JSON Schema.

# Unit test best practices

* A testing unit should focus on one tiny bit of functionality and prove it correct.
* Tests Should Be Fast
* Tests Should Be Simple
* Tests Should Be Readable
* Tests Should Be Deterministic
