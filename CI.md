# CI best practices

## Nix

- I use the publicly available binary caches like [Cachix](https://www.cachix.org/) and [others](https://github.com/br4ch1st0chr0n3/devops-labs/blob/c5cde8ef5fe89c807c779ea81ad3d3125ca9ed67/.github/workflows/ci.yaml#L15)

- The apps have a similar interface in terms of available script names, so I can easily test, lint, and push them to a binary cache or to Docker Hub using the `strategy: matrix` and the same commands
  - this removes a lot of boilerplate and reduces the chances of errors

- I use a custom library to cache [Nix flakes](https://serokell.io/blog/practical-nix-flakes)' inputs and outputs

- This library helped me to make `flake.lock`s 10x - 30x smaller than when I started this project

## Selective runs

