# Available actions

These docs are generated from [docs.nix](../.nix/docs.nix) via [json2md](https://github.com/IonicaBizau/json2md)
and formatted via [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2).
The command to write the docs:

```terminal
nix run .#writeDocs
```

## Keybindings

- `Command palette` - press `Ctrl` (`Cmd`) + `Shift` + `P`
- Stop app - press `Ctrl` (`Cmd`) + `C` in the terminal where that app is running
  - Alternatively, run the corresponding task

## Warning 1

Commands may not work inside VSCodium. In this case, you may try them in an ordinary terminal.

Open it in the `$PROJECT_ROOT` directory and explore the available commands (`packages`).

I added the descriptions to some of them

```terminal
$ nix flake show
# may be not up to date
...
└───packages
  ...
  └───x86_64-linux
      ...
      ├───createVenvs: package 'createVenvs'
      ├───default: package 'codium'
      ├───desc: package 'desc'
      ├───format: package 'flakes-format'
      ├───lintDockerfiles: package 'lintDockerfiles'
      ├───pushToCachix: package 'flakes-push-to-cachix-in-each-dir'
      ├───togglePaths: package 'flakes-toggle-relative-paths'
      ├───updateLocks: package 'flakes-update-in-each-dir'
      ├───writeConfigs: package 'write-configs'
      ├───writeDocs: package 'write-docs-md'
      ├───writeMarkdownlintConfig: package 'write-markdownlint-json'
      ├───writeRootPyproject: package 'write-root-project'
      ├───writeSettings: package 'write-settings-json'
      └───writeTasks: package 'write-tasks-json'
$ nix run .#desc .#desc
... description in Markdown ...
$ nix run .#desc .#writeTasks
... description in Markdown ...

```

## Warning 2

To make available the commands from the next section in your terminal, hit in the `$PROJECT_ROOT`:

```sh
nix develop
```

If you use VSCodium, they're bundled into it and will be available in its terminal

## app_python actions

### app_python: Docker build

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Docker build`

     1. Or `(cd app_python && app-python-docker-build)`

### app_python: Docker push to Docker Hub

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Docker push to Docker Hub`

     1. Or `(cd app_python && app-python-docker-push)`

### app_python: Docker run

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Docker run`

     1. Or `(cd app_python && app-python-docker-run)`

 2. Open [page](http://0.0.0.0:8002) in a browser

### app_python: Docker stop

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Docker stop`

     1. Or `(cd app_python && app-python-docker-stop)`

### app_python: Run

 1. `Command palette` -> `Tasks: Run Task` -> `app_python: Run`

     1. Or `(cd app_python && app-python)`

 2. Open [page](http://0.0.0.0:8000) in a browser

### app_python: Stop

 1. Press `Ctrl` (`Cmd`) + `C` in the terminal

## app_purescript actions

### app_purescript: Docker build

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Docker build`

     1. Or `(cd app_purescript && app-purescript-docker-build)`

### app_purescript: Docker push to Docker Hub

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Docker push to Docker Hub`

     1. Or `(cd app_purescript && app-purescript-docker-push)`

### app_purescript: Docker run

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Docker run`

     1. Or `(cd app_purescript && app-purescript-docker-run)`

 2. Open [page](http://0.0.0.0:8003) in a browser

### app_purescript: Docker stop

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Docker stop`

     1. Or `(cd app_purescript && app-purescript-docker-stop)`

### app_purescript: Run

 1. `Command palette` -> `Tasks: Run Task` -> `app_purescript: Run`

     1. Or `(cd app_purescript && app-purescript)`

 2. Open [page](http://0.0.0.0:8001) in a browser

### app_purescript: Stop

 1. Press `Ctrl` (`Cmd`) + `C` in the terminal
