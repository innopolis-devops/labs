# Time apps

## Descriptions

## app_python

- [PYTHON.md](./app_python/PYTHON.md)

## app_purescript

- [PYTHON.md](./app_purescript/PURESCRIPT.md)

## Nix

I used Nix to make a reproducible project environment. Now, the project ships with:

- `VSCodium` with all necessary extensions - for `Docker`, `Python`, `Purescript`, `Markdown`, etc., with linters and formatters and formatting on save
- development shells
- scripts
  - to generate the `docs`, `settings.json`, `tasks.json`
  - to sync `venv`s of the root (`./`) and `app_python`
  - to start apps via their servers or in `Docker` containers
  - to lint files
  - to cache devshells and push them to Cachix

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

      1. Hook to your shell step `2` - from the docs

1. Enter this project

```sh
git clone https://github.com/br4ch1st0chr0n3/devops-labs
cd devops-labs
git checkout lab2
direnv allow
nix run .# .
```

1. In case the wrong Python `.venv` is sourced, run `Command Palette` -> `Python: Select Interpreter` -> `Python 3.10.6 ('.venv':poetry) ./.venv/bin/python` `Workspace`

1. Try running a task (see [below](./README.md#vscodium-tasks-docs))

## VSCodium Tasks docs

See the [docs](./README/docs.md)

The docs are generated from [docs.nix](./.nix/docs.nix) via [json2md](https://github.com/IonicaBizau/json2md) and formatted via [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2).

## Docker

- For Docker, I used a caching trick described [here](https://fastapi.tiangolo.com/deployment/docker/#docker-cache). Basically, it states that to cache layers, we need to copy the most volatile files into the image as late as possible

- Followed 12-factor-app [guide](https://12factor.net/dev-prod-parity)
  - The server reads from a [dotenv](https://hexdocs.pm/dotenvy/dotenv-file-format.html) file (`.env`)

- Used [heredocs](https://www.docker.com/blog/introduction-to-heredocs-in-dockerfiles/) in Dockerfile to ease reading multiline commands

- Used [hadolint](https://github.com/hadolint/hadolint) to lint `Dockerfile`s and `YAML` VSCodium extension to lint `docker-compose.yml`s

- Used `exec` form for `ENTRYPOINT` and `CMD` in a `Dockerfile` - here's why: [docs](https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example), [SO](https://stackoverflow.com/a/72444233)
  - to be able to store child processes spawned by a shell
  - to provide the default command in `ENTRYPOINT` with overridable `CMD`

## Miscellaneous

## Contact me

- In case of any issues see my [GitHub profile](https://github.com/br4ch1st0chr0n3) for contact information

<!-- TODO how to get size of a project in terms of its nix store part? -->
<!-- 
TODO add command to remove dangling images
https://docs.docker.com/engine/reference/commandline/images/#show-untagged-images-dangling
 
 <!-- TODO document commands -->

<!-- TODO 

add tasks
toggle paths
push to github
lint
push to docker hub

 -->
