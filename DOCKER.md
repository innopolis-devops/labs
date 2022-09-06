# Python best practices for web dev

- do not run container as root unless you need it
- multi-stage build (dart only)
- use as small and basic images as possible
- Do not expose unnessesary ports
- use `.dockerignore`
- Reduce layers amount by combining them to one layer
- Use lint for Dockerfile (some vscode extention was used and checked with [online linter](https://hadolint.github.io/hadolint/))
