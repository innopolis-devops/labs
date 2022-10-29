# Python Info

## Best practices for writing Python apps

1. Use `requirements.txt` or [poetry](https://python-poetry.org) for managing Python packages. For our small web service, `requirements.txt` is enough.
2. Use `.gitignore` file to exclude not relevant files from the git.
3. Use virtual environment for each project to avoid conflicts in the system.
4. Refer to [PEP8](https://peps.python.org/pep-0008/) standard for code style. Or you can use [Black](https://github.com/psf/black) code formatter
5. Use linters to fix little mistakes, stylistic inconsistencies, and dangerous logic. I used [pylint](https://pylint.org)
6. Use static analysis tools to easily detect vulnerabilities or bugs. I used [pylint](https://pylint.org)
7. Use linters for markdown files. I used VScode extension [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

## Flask

Since we are building small single-purpose web service, Flask is a great choice, due to its lightness and simpleness.

### Pros

1. Scalable
2. Flexible
3. Easy to understand
4. Lightweight

### Cons

1. Not a lot of tools
2. Difficult to get familiar with a larger Flask app
3. Maintenance costs
