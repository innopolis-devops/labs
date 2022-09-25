# Time apps

## Descriptions

## app_python

- [PYTHON.md](./app_python/PYTHON.md)
- [README.md](./app_python/README.md)

## app_purescript

- [PYTHON.md](./app_purescript/PURESCRIPT.md)
- [README.md](./app_purescript/README.md)

## Nix

I used Nix to make a reproducible project environment. Now, the project ships with:

- VSCodium with all necessary extensions, settings (if you use our `codium`), and tasks
- dev shells
- startup scripts

## Setup

- Install [Nix](https://nixos.org/download.html) (Single-user installation)

  ```sh
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  ```

- Enable [flakes](https://nixos.wiki/wiki/Flakes#Permanent)

- Install [direnv](https://direnv.net/#basic-installation) - steps 1, 2

- Enter this project

```console
git clone https://github.com/br4ch1st0chr0n3/devops-labs
cd devops-labs
git checkout lab2
direnv allow
(cd app_purescript && direnv allow)
(cd app_python && direnv allow)
nix develop .#codium
```

## Actions

See available actions documentation [here](./README/docs.md).

It's generated via [json2md](https://github.com/IonicaBizau/json2md) and formatted via [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2).

<!-- TODO created local configuration https://python-poetry.org/docs/configuration/ -->

## Miscellaneous

- Sometimes, Firefox refuses to connect to a docker container. In this case, one needs to open a new tab

- What are Docker image tags? - [src]
  - How to correctly tag?

- VSCodium can't execute a command line `nix` if there is a dir called `nix` - [src](https://github.com/OmniSharp/omnisharp-vscode/pull/3372#issuecomment-546447471)

- Environment variables aren't supported by `CMD` in `exec` mode - [src](https://docs.docker.com/engine/reference/builder/#cmd)

<!-- TODO how to get size of a project in terms of its nix store part? -->
<!-- 
remove dangling images
https://docs.docker.com/engine/reference/commandline/images/#show-untagged-images-dangling
 -->