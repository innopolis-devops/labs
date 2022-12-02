[![CI](https://github.com/deemp/devops-labs/actions/workflows/ci.yaml/badge.svg)](https://github.com/deemp/devops-labs/actions/workflows/ci.yaml)

# Time apps

## Descriptions

### Ansible

- [ANSIBLE.md](./ansible/ANSIBLE.md)

### Terraform

- [TF.md](./TF.md)

### Unit tests

- [app_python](./app_python/PYTHON.md#unit-tests)
- [app_purescript](./app_purescript/PURESCRIPT.md#unit-tests)

### CI

- [CI.md](./CI.md)

### Docker

- [DOCKER.md](./DOCKER.md)

### app_python

- [PYTHON.md](./app_python/PYTHON.md)

### app_purescript

- [PURESCRIPT.md](./app_purescript/PURESCRIPT.md)

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
  - to generate the `docs`, `settings.json`, `tasks.json`, and workflow files
  - to start apps via their servers or in `Docker` containers
  - to lint files
  - to cache devshells and push them to [Cachix](https://www.cachix.org/) (a binary cache)

## Setup

1. Install [Nix](https://github.com/deemp/flakes/blob/main/README/NixPrerequisites.md#install-nix)

When prompted, answer `y`

```terminal
git clone https://github.com/deemp/devops-labs
cd devops-labs
git checkout lab9
nix develop
create-venvs-in-each-dir
write-configs
```

1. It's more preferable to start `VSCodium` in a relevant directory with a flake.

  ```sh
  codium .
  # or
  codium app_purescript
  ```

1. `Command Palette`: `Ctrl` (`Cmd`) + `Shift` +`P`

1. In case the wrong Python `.venv` is sourced, go to `Command Palette` -> `Python: Select Interpreter` -> `Python 3.10.6 ('.venv':poetry)` with `./.venv/bin/python`

1. Try running a task `app_purescript: Docker run` (see the [section](#available-actions) below)

1. In case after building `app_purescript` you see the red error messages, go to `Command Palette` -> `Developer: Reload Window`

## Available actions

See the automatically generated [docs](./README/docs.md#available-actions).

## Miscellaneous

What I found out while working on this project - recorded [here](./README/misc.md)

## Contact me

- In case of any issues see my [GitHub profile](https://github.com/deemp) for contact information
