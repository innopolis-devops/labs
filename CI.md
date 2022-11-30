# CI best practices

## Nix

These aren't the official best practices, just useful stuff I came across and applied here

- I used the publicly available binary caches like [Cachix](https://www.cachix.org/) and others (listed in the root `flake.nix`)

- The apps have a similar interface in terms of available script names, so I can easily test, lint, and push them to a binary cache or to Docker Hub using the same commands
  - this removes a lot of boilerplate and reduces the chances of errors

- I used a custom [library](https://github.com/deemp/flakes) to cache [Nix flakes](https://serokell.io/blog/practical-nix-flakes)' inputs and outputs

- Also, this library helped me to make `flake.lock`s 10x - 30x smaller than when I started this project
  - This led to the faster rebuilds and CI

- I generated the workflow file using Nix (see [ci.nix](./nix-files/.github/ci.nix))
  - As Nix is a full-fledged language, it's a safer option than to use [GitHub Expressions](https://docs.github.com/en/actions/learn-github-actions/expressions) (have checked it)

## Team City's version

[source](https://www.jetbrains.com/teamcity/ci-cd-guide/ci-cd-best-practices/)

- [x] Commit early, commit often
  - I had to commit on changes in app directories to get them available in the root `flake.nix`

- [x] Keep the builds green
  - When encountering the failing builds, I tried to fix the errors asap. Finally, I decided to generate a Workflow file

- [x] Build only once
  - The jobs are mostly logically separated and mostly avoid rebuilding the projects

- [x] Streamline your tests
  - I included the tests into workflow

## Selective runs

- CIs and pushes to Docker Hub happen only on changes in the app directories
  - This is managed by the [tj-actions/changed-files](https://github.com/tj-actions/changed-files) action

## Snyk

- Added Snyk vulnerability checks
