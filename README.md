# Time apps

## Descriptions

### app_python

- [PYTHON.md](./app_python/PYTHON.md)

### app_purescript

- [PYTHON.md](./app_purescript/PURESCRIPT.md)

### Docker

- [DOCKER.md](./DOCKER.md)

## Nix

I used Nix to make a reproducible project environment. Now, the project ships with:

- `VSCodium` with all necessary extensions - for
  - `Docker`
  - `Python`
  - `Purescript`
  - `Markdown`
  - etc., with linters and formatters and formatting on save
- development shells
- scripts
  - to generate the `docs`, `settings.json`, `tasks.json`
  - to sync `venv`s of the root (`./`) and `app_python`
  - to start apps via their servers or in `Docker` containers
  - to lint files
  - to cache devshells and push them to [Cachix](https://www.cachix.org/)

Additionally,

- I dramatically reduced the sizes of `flake.locks` by refactoring my flakes repo.They're 10-40 times smaller than when I started doing this lab
- This is due to my refactored [flakes](https://github.com/br4ch1st0chr0n3/flakes) repository

## Setup

1. Install [Nix](https://nixos.org/download.html) (Single-user installation)

  ```sh
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  ```

1. Enable [flakes](https://nixos.wiki/wiki/Flakes#Permanent)

1. Install `direnv`:
   1. Actually install on your system
      - by following the [docs](https://direnv.net/#basic-installation)
      - or via

        ```sh
        nix profile install direnv
        ```

   1. Hook to your shell - step `2` from the docs

1. Enter this project

```terminal
git clone https://github.com/br4ch1st0chr0n3/devops-labs
cd devops-labs
git checkout lab2
direnv allow
nix run .# .
```

1. In case the wrong Python `.venv` is sourced, go to `Command Palette` (`Ctrl` (`Cmd`) + `Shift` +`P`) -> `Python: Select Interpreter` -> `Python 3.10.6 ('.venv':poetry) ./.venv/bin/python` `Workspace`

1. Try running a task (see the [section](./README.md#vscodium-tasks) below)

## VSCodium Tasks

See the [docs](./README/docs.md#available-actions)

The docs are generated from [docs.nix](./.nix/docs.nix) via [json2md](https://github.com/IonicaBizau/json2md) and formatted via [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2).

## Miscellaneous

What I found out while working on this project - recorded [here](./README/misc.md)

## Contact me

- In case of any issues see my [GitHub profile](https://github.com/br4ch1st0chr0n3) for contact information
