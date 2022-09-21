# Time apps

## Setup

- Install [Nix](https://nixos.org/download.html) (Single-user installation)

  ```sh
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  ```

- Enable [flakes](https://nixos.wiki/wiki/Flakes#Permanent)

- Install [direnv](https://direnv.net/#basic-installation) - steps 1, 2

- Enter this project

```sh
git clone https://github.com/br4ch1st0chr0n3/devops-labs
cd devops-labs
git checkout lab1
direnv allow
(cd app_purescript && direnv allow)
(cd app_python && direnv allow)
```

## Commands

- `Command palette` - press `Ctrl` (`Cmd`) + `Shift` + `P`

## Start app_purescript

1. `Command palette` -> `Tasks: Run Task` -> `Start app_python`
1. Open [page](http://127.0.0.1:8000)

## Start app_python

1. `Command palette` -> `Tasks: Run Task` -> `Start app_purescript`
1. Should start a browser
